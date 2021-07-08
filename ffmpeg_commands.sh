ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
 '[0:a]showwaves=s=1280x502:mode=line[sw]' \
-map '[out]' -map 0:a -c:v libx264 -preset fast -crf 18 -c:a copy BenchBendsTheSound.mp4

ffmpeg -i BenchBendsTheSound.mp3 -filter_complex 'acrossover=split=1500[LOW][HIGH]' -map '[LOW]' low.wav -map '[HIGH]' high.wav


ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"[0:a]avectorscope=s=640x518,pad=1280:720[vs]; \
 [0:a]showspectrum=mode=separate:color=intensity:scale=cbrt:s=640x518[ss]; \
 [0:a]showwaves=s=1280x202:mode=line[sw]; \
 [vs][ss]overlay=w[bg]; \
 [bg][sw]overlay=0:H-h,drawtext=fontfile=/Library/Fonts/Impact.ttf:fontcolor=white:x=10:y=10:text='\"Bench Bends the Sound\" by Michael Hugh Kilmer'[out]" \
-map "[out]" -map 0:a -c:v libx264 -preset fast -crf 18 -c:a copy BenchBendsTheSound.mp4

ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"[0:a]avectorscope=s=640x518,pad=1280:720[vs]; \
 [0:a]showspectrum=mode=separate:color=intensity:scale=cbrt:s=640x518[ss]; \
 [0:a]showwaves=s=1280x202:mode=cline[sw]; \
 [vs][ss]overlay=w[bg]; \
 [bg][sw]overlay=0:H-h,drawtext=fontfile=/Library/Fonts/Impact.ttf:fontcolor=white:x=10:y=10:text='\"Bench Bends the Sound\" by Michael Hugh Kilmer'[out]" \
-map "[out]" -map 0:a -c:v libx264 -preset fast -crf 18 -c:a copy BenchBendsTheSound.mkv

ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"showwaves=s=1280x602:mode=line" \
-map "[out]" -map 0:a -c:v libx264 -preset fast -crf 18 -c:a copy BenchBendsTheSound.mkv

ffmpeg -i BenchBendsTheSound.mp3 -filter_complex showwaves=s=1280x602:mode=cline: -map 0:a -c:v libx264 -preset fast -crf 18 -c:a copy  BenchBendsTheSound.mkv

ffmpeg -i BenchBendsTheSound.mp3 -filter_complex showwaves=s=1280x202:mode=cline -acodec copy BenchBendsTheSound.mkv

ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"[0:a]showwaves=s=1280x520:mode=p2p" \
-map 0:a -c:v libx264 -preset fast -crf 18 -c:a copy BenchBendsTheSound.mkv

ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"[0:a]showwaves=s=1280x520:mode=cline" \
-map 0:a -c:v libx264 -preset fast -crf 18 -c:a copy BenchBendsTheSound.mkv

ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"showwaves=s=1280x520:mode=line[sw]" \
-map "[sw]" -c:v libx264 -preset fast -crf 18 -c:a copy BenchBendsTheSoundLine.mp4

ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"showwaves=s=1280x520:mode=cline[sw]" \
-map "[sw]" -c:v libx264 -preset fast -crf 18 -c:a copy BenchBendsTheSoundCline.mp4


ffmpeg -y -i BenchBendsTheSound.mp3 -filter_complex "
[0:a]showwaves=mode=cline:s=1920x1080[v]
" -map '[v]' -map '0:a' -c:a copy \
  "BenchBendsTheSound.mp4"

ffmpeg -y -i "BenchBendsTheSound.mp3" -filter_complex "
[0:a]showcqt=s=1920x1080[vcqt];
[0:a]showvolume,colorkey=black,scale=1280:40[vv];
[0:a]showwaves=split_channels=1:mode=line:s=1280x480[vs];
[vs][vv]overlay=x=0:y=(H-h)/2[v1];
[vcqt][v1]overlay=x=W-w-50:y=50[v]
" -map '[v]' -map '0:a' -c:a copy \
  "BenchBendsTheSound.mp4"

ffmpeg -y -i "BenchBendsTheSound.mp3" -filter_complex "
[0:a]showcqt=s=820x480[vcqt];
[0:a]showvolume,colorkey=black,scale=1280:40[vv];
[0:a]showwaves=split_channels=1:mode=line:s=1280x480[vs];
[vs][vv]overlay=x=0:y=(H-h)/2[v1];
[vcqt][v1]overlay=x=W-w-50:y=50[v]
" -map '[v]' -map '0:a' -c:a copy \
  "BenchBendsTheSoundFive.mp4"
  
ffmpeg -i "BenchBendsTheSound.mp3" -filter_complex \
"[0:a]showwaves=mode=line:s=hd480:colors=Magenta[v]" \
-map "[v]" -map 0:a -pix_fmt yuv420p \
-b:a 360k -r:a 44100  BenchBendsTheSoundSix.mp4

ffmpeg -i "BenchBendsTheSound.mp3" -filter_complex \
"[0:a]showwaves=mode=cline:s=1280x480:colors=Magenta[v]" \
-map "[v]" -map 0:a -pix_fmt yuv420p \
-b:a 360k -r:a 44100  BenchBendsTheSoundSeven.mp4

ffmpeg -i "BenchBendsTheSound.mp3" -filter_complex \
"[0:a]showwaves=mode=cline:s=1280x480:colors=Magenta|Azure|White[v]" \
-map "[v]" -map 0:a -pix_fmt yuv420p \
-b:a 360k -r:a 44100  BenchBendsTheSoundEight.mp4


ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"[0:a]showwaves=mode=cline:s=1280x480:colors=Magenta|Azure|White:r=25, colorkey=0x000000:0.1:0.5[v]" \
-map "[v]" -map 0:a -pix_fmt yuv420p \
-b:a 360k -r:a 44100  BenchBendsTheSoundNine.mp4


ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"[0:a]showwaves=mode=p2p:s=1280x480:colors=Magenta|Azure|White:r=25, colorkey=0x000000:0.1:0.1[v]; \
 [v]dilation=threshold3=10[v]" \
-map "[v]" -map 0:a -pix_fmt yuv420p \
-b:a 360k -r:a 44100  BenchBendsTheSoundTen.mp4


ffmpeg -i /Volumes/Oggun/Original\ Work/OriginalRecordings/Am\ I\ Dreaming\ Now/mp3/Michael\ Hugh\ Kilmer/Am\ I\ Dreaming\ Now\ Vol\ 1/Market\ Slave.mp3 -filter_complex \
"[0:a]showwaves=mode=p2p:s=1600x900:colors=yellow:r=25, colorkey=0x000000:0.1:0.1[v]; \
 [v]dilation=threshold3=10[v]" \
-map "[v]" -map 0:a -pix_fmt yuv420p \
-b:a 360k -r:a 44100  MarketSlave.mkv

ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"[0:a]showwaves=mode=p2p:s=1280x480:colors=Magenta|Azure|White:r=25 \
 [v]dilation=threshold3=10[v]; \
 [v]colorkey=0x000000:0.1:0.1[v];"
-map "[v]" -map 0:a -pix_fmt yuv420p \
-b:a 360k -r:a 44100  BenchBendsTheSoundEleven.mp4

ffmpeg -y -i BenchBendsTheSound.mp3 -filter_complex \
"[0:a] showwaves=size=1280x100:mode=line:r=25, colorkey=0x000000:0.1:0.1[wave]; \
[1:v][wave] overlay=y=H-h:eval=init[canvas]; \
[canvas]drawtext=fontfile=/Library/Fonts/Impact.ttf:fontcolor=white:x=10:y=10:text='\"Bench Bends the Sound\" by Michael Hugh Kilmer'"  \
-shortest -acodec copy -vcodec libx264 -pix_fmt yuv420p -preset ultrafast -tune stillimage -crf 19 -movflags faststart BenchBendsTheSoundTwelve.mp4

source: https://superuser.com/a/1648134/328722
ffmpeg -i BenchBendsTheSound.mp3 -filter_complex \
"[0:a]showwaves=mode=cline:s=1280x480:colors=Magenta|Azure|White[sw]; \
 color=s=1280x480:c=#00ff00[bg]; \
 [bg][sw]overlay=format=auto:shortest=1,format=yuv420p[v]" \
-map "[v]" -map 0:a -c:a copy BenchBendsTheSoundThirteen.mkv

ffmpeg -i "You I Love.aif" -filter_complex \
"[0:a]showwaves=mode=cline:s=1280x480:colors=Magenta|Azure|White[sw]; \
 color=s=1280x480:c=#f40b0f[bg]; \
 [bg][sw]overlay=format=auto:shortest=1,format=yuv420p[v]" \
-map "[v]" -map 0:a -c:a copy YouILove.mkv

ffmpeg -i video.mp4 -i image.png -filter_complex "[0:v][1:v] overlay=(W-w)/2:(H-h)/2:enable='between(t,0,20)'" -pix_fmt yuv420p -c:a copy output.mp4

ffmpeg -i "You I Love.aif" -i SweetTartHeart.png -filter_complex \
"[0:a] showwaves=mode=cline:s=1600x900:colors=Magenta|Azure|White[sw]; \
 color=s=1600x900:c=#F4CCE6[bg]; \
 [bg] [1:v] overlay=(1600-820)/2:(900-770)/2:enable='between(t,0,20)'[mid]; \
 [mid] [sw] overlay=format=auto:shortest=1,format=yuv420p[v]" \
-map "[v]" -map 0:a -c:a copy YouILove.mkv

ffmpeg -i "You I Love.mp3" -i ILoveYouHeart.png -filter_complex \
"[0:a] showwaves=mode=cline:s=1600x900:colors=Magenta|Azure|White[sw]; \
 color=s=1600x900:c=#F4CCE6[bg]; \
 [bg] [1:v] overlay=(1600-820)/2:(900-770)/2:enable='between(t,0,20)'[mid]; \
 [mid] [sw] overlay=format=auto:shortest=1,format=yuv420p[v]" \
-map "[v]" -map 0:a -c:a copy YouILove.mp4

ffmpeg -i "You I Love.mp3" -i ILoveYouHeart.png -filter_complex \
"[0:a] showwaves=mode=p2p:s=1600x900:colors=#D13F3F[sw]; \
 [sw]dilation=threshold1=40[sw]; \
 color=s=1600x900:c=#F4CCE6[bg]; \
 [bg] [1:v] overlay=(1600-820)/2:(900-770)/2:enable='between(t,0,20)'[mid]; \
 [mid] [sw] overlay=format=auto:shortest=1,format=yuv420p[v]" \
-map "[v]" -map 0:a -c:a copy YouILove.mp4

ffmpeg -i MmmmBeMine.mp3 -i BeMineHeart.png -filter_complex \
"[0:a] showwaves=mode=p2p:s=1600x900:colors=#D13F3F[sw]; \
 [sw]dilation=threshold1=80[sw]; \
 color=s=1600x900:c=#F4CCE6[bg]; \
 [bg] [1:v] overlay=(1600-820)/2:(900-770)/2[mid]; \
 [mid] [sw] overlay=format=auto:shortest=1,format=yuv420p[v]" \
-map "[v]" -map 0:a -c:a copy MmmmBeMine.mp4

ffmpeg -i OhINeedYou.mp3 -i INeedYouHeart.png -filter_complex \
"[0:a] showwaves=mode=p2p:s=1600x900:colors=#D13F3F[sw]; \
 [sw]dilation=threshold1=80[sw]; \
 color=s=1600x900:c=#F4CCE6[bg]; \
 [bg] [1:v] overlay=0:0[mid]; \
 [mid] [sw] overlay=format=auto:shortest=1,format=yuv420p[v]" \
-map "[v]" -map 0:a -c:a copy OhINeedYou.mp4

ffmpeg -i YoureMagic.mp3 -i YoureMagic.png -filter_complex \
"[0:a] showwaves=mode=p2p:s=1600x900:colors=#D13F3F[sw]; \
 [sw]dilation=threshold1=80[sw]; \
 color=s=1600x900:c=#C5AE3B[bg]; \
 [bg] [1:v] overlay=0:0[mid]; \
 [mid] [sw] overlay=format=auto:shortest=1,format=yuv420p[v]" \
-map "[v]" -map 0:a -c:a copy YoureMagic.mp4

ffmpeg -i HiBeautiful.mp3 -i HiBeautiful.png -filter_complex \
"[0:a] showwaves=mode=p2p:s=1600x900:colors=#D13F3F[sw]; \
 [sw]dilation=threshold1=80[sw]; \
 color=s=1600x900:c=#C5AE3B[bg]; \
 [bg] [1:v] overlay=0:0[mid]; \
 [mid] [sw] overlay=format=auto:shortest=1,format=yuv420p[v]" \
-map "[v]" -map 0:a -c:a copy HiBeautiful.mp4

ffmpeg -i Maybe.mp3 -i Maybe.png -filter_complex \
"[0:a] showwaves=mode=p2p:s=1600x900:colors=#D13F3F[sw]; \
 [sw]dilation=threshold1=80[sw]; \
 color=s=1600x900:c=#C5AE3B[bg]; \
 [bg] [1:v] overlay=0:0[mid]; \
 [mid] [sw] overlay=format=auto:shortest=1,format=yuv420p[v]" \
-map "[v]" -map 0:a -c:a copy Maybe.mp4


ffmpeg -i ShowMeSundayMorning.mp3 -filter_complex \
"[0:a] showwaves=mode=line:s=1600x900:colors=009dbd|White[sw]; \
 color=s=1600x900:c=#5e1278[bg]; \
 [bg] [sw] overlay=format=auto:shortest=1, \
 format=yuv420p, \
 drawtext=fontfile=/Library/Fonts/Impact.ttf: \
 fontcolor=#009dbd:x=1000:y=850:text='\"Show Me Sunday Morning\" from Am I Dreaming Now? (vol 2) by Michael Hugh Kilmer':fontsize=20:
 [v]" \
-map "[v]" -map 0:a -c:a copy ShowMeSundayMorning.mp4

ffmpeg -i ShowMeSundayMorning.mp3 -filter_complex \
"[0:a] showwaves=mode=line:s=1600x900:colors=009dbd|White[sw]; \
 color=s=1600x900:c=#5e1278[bg]; \
 [bg] [sw] overlay=format=auto:shortest=1, \
 format=yuv420p, \
 drawtext=fontfile=/Library/Fonts/Courier\ New\ Bold.ttf: \
 fontcolor=#009dbd:x=10:y=10:text='Show Me Sunday Morning':fontsize=40, \
 drawtext=fontfile=/Library/Fonts/Courier\ New\ Bold.ttf: \
 fontcolor=#009dbd:x=400:y=860:text='Am I Dreaming Now? (vol 2) by Michael Hugh Kilmer':fontsize=40
 [v]" \
-map "[v]" -map 0:a -c:a copy ShowMeSundayMorning.mp4

ffmpeg -i obsidian_steps.mp3 -filter_complex \
"[0:a] showwaves=mode=line:s=1600x900:colors=#94adff|#857aff[sw]; \
 color=s=1600x900:c=#17002e[bg]; \
 [bg] [sw] overlay=format=auto:shortest=1, \
 format=yuv420p, \
 drawtext=fontfile=/Library/Fonts/Courier\ New\ Bold.ttf: \
 fontcolor=#94adff:x=10:y=10:text='Obsidian Steps':fontsize=40, \
 drawtext=fontfile=/Library/Fonts/Courier\ New\ Bold.ttf: \
 fontcolor=#94adff:x=400:y=860:text='Am I Dreaming Now? (vol 2) by Michael Hugh Kilmer':fontsize=40
 [v]" \
-map "[v]" -map 0:a -c:a copy obsidian_steps.mp4

ffmpeg -i ReasonEnough.mp3 -filter_complex \
"[0:a] showwaves=mode=line:s=1600x900:colors=#ffc2ca|#2f00ff[sw]; \
 color=s=1600x900:c=#007ba8[bg]; \
 [bg] [sw] overlay=format=auto:shortest=1, \
 format=yuv420p, \
 drawtext=fontfile=/Library/Fonts/Courier\ New\ Bold.ttf: \
 fontcolor=#ffc2ca:x=10:y=10:text='Reason Enough':fontsize=40, \
 drawtext=fontfile=/Library/Fonts/Courier\ New\ Bold.ttf: \
 fontcolor=#ffc2ca:x=400:y=860:text='Am I Dreaming Now? (vol 2) by Michael Hugh Kilmer':fontsize=40
 [v]" \
-map "[v]" -map 0:a -c:a copy ReasonEnough.mp4

ffmpeg -i WashWhiteDressOfMurderFriend.mp3 -filter_complex \
"[0:a] showwaves=mode=line:s=1600x900:colors=#d8eaee|#a0ccd4[sw]; \
 color=s=1600x900:c=#80bac6[bg]; \
 [bg] [sw] overlay=format=auto:shortest=1, \
 format=yuv420p, \
 drawtext=fontfile=/System/Library/Fonts/Supplemental/Courier\ New\ Bold.ttf: \
 fontcolor=#ffc2ca:x=10:y=10:text='Wash White Dress of Murder Friend':fontsize=40, \
 drawtext=fontfile=/System/Library/Fonts/Supplemental/Courier\ New\ Bold.ttf: \
 fontcolor=#ffc2ca:x=400:y=860:text='Am I Dreaming Now? (vol 2) by Michael Hugh Kilmer':fontsize=40
 [v]" \
-map "[v]" -map 0:a -c:a copy WashWhiteDressOfMurderFriend.mp4

ffmpeg -i BadBoyfriend.mp3 -filter_complex \
"[0:a] showwaves=mode=line:s=1600x900:colors=#eb9ebd|#f5d0df[sw]; \
 color=s=1600x900:c=#a52256[bg]; \
 [bg] [sw] overlay=format=auto:shortest=1, \
 format=yuv420p, \
 drawtext=fontfile=/System/Library/Fonts/Supplemental/Courier\ New\ Bold.ttf: \
 fontcolor=#ffc2ca:x=10:y=10:text='Bad Boyfriend':fontsize=40, \
 drawtext=fontfile=/System/Library/Fonts/Supplemental/Courier\ New\ Bold.ttf: \
 fontcolor=#ffc2ca:x=400:y=860:text='Am I Dreaming Now? (vol 2) by Michael Hugh Kilmer':fontsize=40
 [v]" \
-map "[v]" -map 0:a -c:a copy BadBoyfriend.mp4

ffmpeg -i CollardsSexandTouring.mp3 -filter_complex \
"[0:a] showwaves=mode=line:s=1600x900:colors=#123800|#061400[sw]; \
 color=s=1600x900:c=#2c8a00[bg]; \
 [bg] [sw] overlay=format=auto:shortest=1, \
 format=yuv420p, \
 drawtext=fontfile=/System/Library/Fonts/Supplemental/Courier\ New\ Bold.ttf: \
 fontcolor=#061400:x=10:y=10:text='Collards, Sex and Touring':fontsize=40, \
 drawtext=fontfile=/System/Library/Fonts/Supplemental/Courier\ New\ Bold.ttf: \
 fontcolor=#061400:x=400:y=860:text='Am I Dreaming Now? (vol 2) by Michael Hugh Kilmer':fontsize=40
 [v]" \
-map "[v]" -map 0:a -c:a copy CollardsSexandTouring.mp4

ffmpeg -i LetItEnd.mp3 -filter_complex \
"[0:a] showwaves=mode=line:s=1600x900:colors=#0aa5ff|#f96[sw]; \
 color=s=1600x900:c=#ffef0a[bg]; \
 [bg] [sw] overlay=format=auto:shortest=1, \
 format=yuv420p, \
 drawtext=fontfile=/System/Library/Fonts/Supplemental/Courier\ New\ Bold.ttf: \
 fontcolor=#0aa5ff:x=10:y=10:text='Let It End':fontsize=40, \
 drawtext=fontfile=/System/Library/Fonts/Supplemental/Courier\ New\ Bold.ttf: \
 fontcolor=#0aa5ff:x=400:y=860:text='Am I Dreaming Now? (vol 2) by Michael Hugh Kilmer':fontsize=40
 [v]" \
-map "[v]" -map 0:a -c:a copy LetItEnd.mp4

