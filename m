From: "Andy Walker" <ajwalker@broadpark.no>
Subject: Re: Penguin color problems on HCRX-24
Date: Mon, 1 Nov 2004 15:03:39 +0100 (CET)
Message-ID: <7738.193.160.141.5.1099317819.squirrel@193.160.141.5>
References: <200410292228.14940.j.raspe@t-online.de>
    <200410311506.00662.j.raspe@t-online.de>
    <34548.127.0.0.1.1099261219.squirrel@127.0.0.1>
    <200411011345.36889.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: "Johannes Raspe" <j.raspe@t-online.de>,
 parisc-linux@lists.parisc-linux.org
To: "Helge Deller" <deller@gmx.de>
Return-Path: <ajwalker@broadpark.no>
In-Reply-To: <200411011345.36889.deller@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>

> On Sunday 31 October 2004 23:20, Andy Walker wrote:
>> I'd like to submit the patch below to sanitize the stifb=bpp:x:y:z
>> option
>> handling. The recent patch (by Stuart Brady?) made fb initialization
>> stop
>> early once the default sti fb was initialized, possibly leaving other
>> fb's
>> uninitialized.
>
> yes - this is a bug.
>
>> Also the handling of a "global default" bpp was rather wacky,
>
> I liked that idea. No need to initialize all bpps.
>
>> and some array index/bounds problems were fixed.
>
> Correct.
>
>> Is initdata guaranteed to be zero'ed? If so then the loop setting all
>> the
>> elements of stifb_bpp_pref to zero can be dropped.
>
> Yes, it's guaranteed.
>
>> The patch has been tested with two fb's, switching console fb either by
>> PDC or using the
>> 'sti=' commandline option.
>
> Could you please test the attached patch instead. It is based on your
> patch, but the "global bpp" is still there.
>
> Helge
>

Hi Helge,

The logic is all wrong though IMHO. What it say is:

- If I have specified a bpp for *ANY* fb, then default
  the others to their "capability" - for HCRX24 this is 32.

- If I have not specified any bpp's then default to 8bpp
  on all.

e.g. with a Vis-EG on fb0 and an HCRX24's on fb1 and the commandline:

  stif=bpp:8

fb0 comes up 8bpp and fb1 comes up 32bpp, but with no commandline
they both come up 8bpp. That's weird.

My change made the logic:

- Default all fb's to their "capability", except where the
  user says otherwise for a given fb (you can default an fb
  by setting 0 e.g. stifb=bpp=0:8).

By "capability" I mean the default value in sti_init_fb.

I can live with either solution though, as long as the code
works as advertised :-)

-Andy
