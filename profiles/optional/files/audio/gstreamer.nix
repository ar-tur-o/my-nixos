{pkgs, ...}: {
  home.packages = with pkgs; [
    # core plugins
    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good

    # extra codecs and formats
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav

    # for metadata and tagging
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
  ];
}
