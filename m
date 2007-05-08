From: "Thibaut VARENE" <T-Bone@parisc-linux.org>
Subject: Re: [parisc-linux] Sound problems on a C3600
Date: Tue, 8 May 2007 17:00:52 +0200
Message-ID: <7d01f9f00705080800tee6623fpa1329d546049d80a__11072.9874497794$1416624353$gmane$org@mail.gmail.com>
References: <462A3C0D.8090004@web.de>
	<7d01f9f00704212103q1c6f8d42lc275946dceb8a893@mail.gmail.com>
	<463F732D.6050904@web.de>
	<7d01f9f00705071531n6d5d045i365ddeb2074c6e5f@mail.gmail.com>
	<46407770.3040302@web.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: "Julian Stecklina" <der_julian@web.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <46407770.3040302@web.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 5/8/07, Julian Stecklina <der_julian@web.de> wrote:
> Thibaut VARENE wrote:

> >>  > mplayer -ao alsa ...
> >>
> >> Doesn't work, noise. (Endian problem? Mplayer's fault?)
> >
> > Expected
>
> Why is that?

Because it never worked in the first place, and I asserted the driver
wasn't at fault by testing it on another platform (namely PowerPC).

> > If by 'signaling issue' you mean the random crash when doing ctrl-C, I
> > don't know if it's fixed. The best way to check is to try ;)
>
> My kernel crashes. :-/

Well then, that's one more bug we still have... ;-P

-- 
Thibaut VARENE
http://www.parisc-linux.org/~varenet/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
