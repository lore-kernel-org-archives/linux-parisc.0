From: "Paul" <paul@techcenter3000.com>
Subject: Re: [parisc-linux] [PATCH] Harmony driver - Reject AFMT_S16_LE
	&Implement SNDCTL_DSP_CHANNELS
Date: Tue, 11 May 2004 09:39:01 -0500
Message-ID: <008b01c43765$b3fe0450$0702a8c0@tfam.org>
References: <20040222092057.GA2590@calypso>
	<20040223035601.GA988@calypso><20040511052451.GC27478@colo.lackof.org>
	<20040511130737.GP16118@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  format=flowed;
  charset="iso-8859-1";
  reply-type=original
Cc: parisc-linux@lists.parisc-linux.org
To: "Matthew Wilcox" <willy@debian.org>,
 "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Actually, ALSA Harmony driver is compiling at this point (2.6.6-rc3-pa9), 
with the caveat that you need the latest CVS of sound/parisc..
Takashi Iwai has been kind enough to work on this, with me doing some basic 
testing. Unfortunately, my testing hit a snag when a hard drive started 
releasing magic smoke ever so slowly.

Thanks
Paul

----- Original Message ----- 
From: "Matthew Wilcox" <willy@debian.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
Cc: <parisc-linux@lists.parisc-linux.org>
Sent: Tuesday, May 11, 2004 8:07 AM
Subject: Re: [parisc-linux] [PATCH] Harmony driver - Reject AFMT_S16_LE 
&Implement SNDCTL_DSP_CHANNELS


> On Mon, May 10, 2004 at 11:24:51PM -0600, Grant Grundler wrote:
>> 2) OSS is "decprecated" according to the 2.6 sound/Kconfig "Help".
>>    Ie use ALSA instead.  See SOUND_PRIME option.
>>
>> In 2.6, ALSA harmony driver does NOT compile and that's disappointing.
>
> The basic problem here is that ALSA doesn't use the generic device model.
> It has its own crazy set of bus abstractions which would all need to
> be implemented for the parisc_device ... for the benefit of one driver.
> Small wonder nobody's been interested in doing the work yet.
>
> I think we'll be sticking with OSS Harmony for a while.
>
> -- 
> "Next the statesmen will invent cheap lies, putting the blame upon
> the nation that is attacked, and every man will be glad of those
> conscience-soothing falsities, and will diligently study them, and refuse
> to examine any refutations of them; and thus he will by and by convince
> himself that the war is just, and will thank God for the better sleep
> he enjoys after this process of grotesque self-deception." -- Mark Twain
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
