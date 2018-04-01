# DOGI
a Debian docker image that contain the following software packages: [Drive](https://github.com/odeke-em/drive) [OpenVPN](https://openvpn.net/) and [Get_Iplayer](https://github.com/get-iplayer/get_iplayer).

## Problem Statement
You want to download a lot of iPlayer videos on to your server, but your server doesn't have enough space, but you happen to have a lot of space on your Google Drive. Your server does not have an UK-based IP address. You only have headless access to your server.

## Solution
Run an interactive Debian Docker instance, run OpenVPN in that docker instance, download videos using get_iplayer, push the videos to your Google Drive, then delete the video. 

## Implementation
1. Put your OpenVPN settings into the ``openvpn`` folder.
2. Set up Drive in the ``output`` folder. 
3. Run ``run.sh`` to obtain an interactive shell. 
4. Run ``/etc/init.d/openvpn start``
5. ``get_iplayer`` is in /root.

  * Note that if you don't create the ``openvpn`` and ``output`` folders, ``run.sh`` will create them for you. However, of course you still have to configure them manually. 
  * You have to comment the last line in ``get_iplayer_settings/options`` to enable automatic Google Drive uploading/deletion.

## Disclaimer
Please delete everything you download after 30 days. Please don't violate copyright laws. For more information, please refer to [BBC website](https://www.bbc.co.uk/iplayer/help/downloads/mobile-tablet/downloads_availability_changing).

Please keep the following quotes from *The IT Crowd* in your mind when you are using get_iplayer:
> You wouldn’t steal a car  
> You wouldn’t steal a handbag  
> You wouldn’t steal a television  
> You wouldn’t steal a movie  
>   
> Downloading pirated films is stealing,  
> stealing is against the law,  
> **PIRACY. IT’S A CRIME**
