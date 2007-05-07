From: Julian Stecklina <der_julian@web.de>
Subject: Re: [parisc-linux] Sound problems on a C3600
Date: Mon, 07 May 2007 20:42:53 +0200
Message-ID: <463F732D.6050904__41666.5710429244$1416624356$gmane$org@web.de>
References: <462A3C0D.8090004@web.de>
	<7d01f9f00704212103q1c6f8d42lc275946dceb8a893@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <7d01f9f00704212103q1c6f8d42lc275946dceb8a893@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thibaut VARENE wrote:
> On 4/21/07, Julian Stecklina <der_julian@web.de> wrote:
>> Hello,
>>
>> I am trying to get my HP Visualize C3600 to output some sound, but
>> without luck so far. Both the onboard AD1889 sound chip and a
>> Soundblaster Live! PCI only produce highly distorted noises with the
>> 2.6.20.1 kernel.
> 
> That "sounds" like an old alsa-on-parisc bug that I thought was fixed,
> but could you try using the OSS emulation instead of native ALSA, see
> if it does any better?

Tests done using the onboard AD1889 without any .asoundrc:

 > mplayer -ao oss ...
...
AO: [oss] 44100Hz 2ch s16be (2 bytes per sample)
...
Works!

 > mplayer -ao alsa ...
alsa-init: requested format: 44100 Hz, 2 channels, 8
alsa-init: using ALSA 1.0.14rc1
alsa-init: setup for 1/2 channel(s)
alsa-init: using device default
alsa-init: pcm opened in blocking mode
alsa-init: chunksize set to 1024
alsa-init: fragcount=16
alsa-init: got buffersize=65536
alsa-init: got period size 1024
alsa: 44100 Hz/2 channels/4 bpf/65536 bytes buffer/Signed 16 bit Big Endian
AO: [alsa] 44100Hz 2ch s16be (2 bytes per sample)


Doesn't work, noise. (Endian problem? Mplayer's fault?)

 > mplayer -ao alsa:device=hw=0,0 ...
...
alsa-init: requested format: 44100 Hz, 2 channels, 8
alsa-init: using ALSA 1.0.14rc1
alsa-init: setup for 1/2 channel(s)
alsa-init: using device hw:0
alsa-init: pcm opened in blocking mode
[AO_ALSA] Format s16be is not supported by hardware, trying default.
alsa-init: chunksize set to 1024
alsa-init: fragcount=16
alsa-init: got buffersize=65536
alsa-init: got period size 1024
alsa: 44100 Hz/2 channels/4 bpf/65536 bytes buffer/Signed 16 bit Little 
Endian
AO: [alsa] 44100Hz 2ch s16le (2 bytes per sample)
...

Works?!

I then did some tests using mpg123:
An mpg123 using OSS produces only noise as well (seems to be the endian 
issue again). An ALSA mpg123 produces some "cracks" and "scritches" (my 
English is probably not good enough to properly describe this), unless I 
   cause some disk access, then it produces distorted (but sometimes 
recognizable) sound...

uname -a:
Linux efficio 2.6.20.1-hppa #12 Mon May 7 17:40:45 CEST 2007 parisc
PA8600 (PCX-W+) 9000/785/C3600 GNU/Linux

I am happy to supply any needed debugging information. And btw, is the 
signaling issue mentioned in http://wiki.parisc-linux.org/AD1889 fixed, yet?

Regards,
Julian
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
