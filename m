From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Sound problems on a C3600
Date: Tue, 8 May 2007 00:31:52 +0200
Message-ID: <7d01f9f00705071531n6d5d045i365ddeb2074c6e5f__31132.929135538$1416624356$gmane$org@mail.gmail.com>
References: <462A3C0D.8090004@web.de>
	<7d01f9f00704212103q1c6f8d42lc275946dceb8a893@mail.gmail.com>
	<463F732D.6050904@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Julian Stecklina" <der_julian@web.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <463F732D.6050904@web.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 5/7/07, Julian Stecklina <der_julian@web.de> wrote:
> Tests done using the onboard AD1889 without any .asoundrc:
>
>  > mplayer -ao oss ...
> ...
> AO: [oss] 44100Hz 2ch s16be (2 bytes per sample)
> ...
> Works!

Expected

>  > mplayer -ao alsa ...
>
> Doesn't work, noise. (Endian problem? Mplayer's fault?)

Expected

>  > mplayer -ao alsa:device=hw=0,0 ...

> Works?!

Unexpected ;)

> I then did some tests using mpg123:
> An mpg123 using OSS produces only noise as well (seems to be the endian
> issue again). An ALSA mpg123 produces some "cracks" and "scritches" (my
> English is probably not good enough to properly describe this), unless I
>    cause some disk access, then it produces distorted (but sometimes
> recognizable) sound...

Last time I tried, mpg123 was working for me. The noise issue is
unfortunately a known one without a clear explanation yet, making hard
(if not impossible) to fix...

> uname -a:
> Linux efficio 2.6.20.1-hppa #12 Mon May 7 17:40:45 CEST 2007 parisc
> PA8600 (PCX-W+) 9000/785/C3600 GNU/Linux
>
> I am happy to supply any needed debugging information. And btw, is the
> signaling issue mentioned in http://wiki.parisc-linux.org/AD1889 fixed, yet?

If by 'signaling issue' you mean the random crash when doing ctrl-C, I
don't know if it's fixed. The best way to check is to try ;)

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
