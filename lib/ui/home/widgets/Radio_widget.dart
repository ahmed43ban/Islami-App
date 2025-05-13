import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/provider/radio_manger_provider.dart';
import 'package:islami/style/assetsmanger.dart';
import 'package:islami/style/colorsmanger.dart';
import 'package:provider/provider.dart';
import 'package:islami/style/Constant.dart';
import 'package:islami/model/SuraModel.dart';

class RadioWidget extends StatefulWidget {
  final String name;
  final String url;
  final bool isRadio;
  final List<int> surahList;
  final String? baseUrl; // جديد فقط للقراء

  const RadioWidget({
    super.key,
    required this.name,
    required this.url,
    this.isRadio = true,
    this.surahList = const [],
    this.baseUrl,
  });

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool isVolume = true;
  int? selectedSura;

  @override
  Widget build(BuildContext context) {
    final playUrl = widget.isRadio
        ? widget.url
        : (selectedSura != null ? "${widget.baseUrl}${selectedSura}.mp3" : "");

    final suraModel = selectedSura != null
        ? SuraList.firstWhere(
          (sura) => sura.suraNumber == selectedSura,
      orElse: () => SuraModel(
        suraNameAr: "غير معروف",
        suraNameEn: "",
        versesNumber: "",
        suraNumber: 0,
      ),
    )
        : null;

    return Consumer<RadioMangerProvider>(
      builder: (context, provider, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: ColorManger.primary,
          ),
          height: 160.h,
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: REdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  widget.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    fontFamily: "janna",
                    color: ColorManger.secondary,
                  ),
                ),
              ),
              if (selectedSura != null && !widget.isRadio)
                Padding(
                  padding: REdgeInsets.only(bottom: 4.0),
                  child: Text(
                    "سورة ${suraModel?.suraNameAr}",
                    style: TextStyle(
                      fontFamily: "janna",
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorManger.secondary,
                    ),
                  ),
                ),
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.asset(
                      (provider.isPlaying &&
                          provider.currentPlayingUrl == playUrl)
                          ? AssetsManger.soundWave
                          : AssetsManger.mosque2,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: REdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              if (playUrl.isNotEmpty) {
                                provider.play(playUrl);
                                setState(() {});
                              }
                            },
                            icon: Icon(
                              (provider.currentPlayingUrl == playUrl &&
                                  provider.isPlaying)
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              size: 45.sp,
                              color: ColorManger.secondary,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              if (provider.currentPlayingUrl == playUrl) {
                                provider.stop();
                              }
                              setState(() {});
                            },
                            icon: Icon(
                              Icons.stop,
                              size: 45.sp,
                              color: ColorManger.secondary,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                isVolume = !isVolume;
                                provider.setVolume(isVolume ? 2.0 : 0);
                              });
                            },
                            icon: Icon(
                              isVolume
                                  ? Icons.volume_up
                                  : Icons.volume_off_rounded,
                              size: 45.sp,
                              color: ColorManger.secondary,
                            ),
                          ),
                          if (!widget.isRadio)
                            IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    int? tempSelectedSura = selectedSura;
                                    return Container(
                                      color: ColorManger.primary,
                                      child: Stack(
                                        fit: StackFit.expand,
                                        children: [
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Image.asset(
                                              AssetsManger.mosque,
                                              color: ColorManger.secondary,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Image.asset(
                                                    AssetsManger.leftcorner,
                                                    color:
                                                    ColorManger.secondary,
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      "اختر السورة",
                                                      textAlign:
                                                      TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: "janna",
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 27.sp,
                                                        color: ColorManger
                                                            .secondary,
                                                      ),
                                                    ),
                                                  ),
                                                  Image.asset(
                                                    AssetsManger.rightcorner,
                                                    color:
                                                    ColorManger.secondary,
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: StatefulBuilder(
                                                  builder: (context,
                                                      setModalState) {
                                                    return ListView.builder(
                                                      itemCount: widget
                                                          .surahList.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        final suraNumber = widget
                                                            .surahList[index];
                                                        final sura =SuraList
                                                            .firstWhere(
                                                              (s) =>
                                                          s.suraNumber ==
                                                              suraNumber,
                                                          orElse: () =>
                                                              SuraModel(
                                                                suraNameAr:
                                                                "غير معروف",
                                                                suraNameEn: "",
                                                                versesNumber: "",
                                                                suraNumber: 0,
                                                              ),
                                                        );

                                                        return RadioListTile<
                                                            int>(
                                                          value: suraNumber,
                                                          groupValue:
                                                          tempSelectedSura,
                                                          title: Text(
                                                            'سورة ${sura.suraNameAr}',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontFamily:
                                                              "janna",
                                                              fontSize: 20.sp,
                                                              fontWeight:
                                                              FontWeight
                                                                  .bold,
                                                              color: ColorManger
                                                                  .secondary,
                                                            ),
                                                          ),
                                                          onChanged: (value) {
                                                            setModalState(() {
                                                              tempSelectedSura =
                                                                  value;
                                                            });

                                                            Future.delayed(
                                                              Duration(
                                                                  milliseconds:
                                                                  200),
                                                            ).then((_) {
                                                              setState(() {
                                                                selectedSura =
                                                                    tempSelectedSura;
                                                              });

                                                              Navigator.pop(
                                                                  context);
                                                            });
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.search,
                                size: 45.sp,
                                color: ColorManger.secondary,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
