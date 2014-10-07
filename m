From: Helge Deller <deller@gmx.de>
Subject: Re: systemd on hppa and number of free RT signals
Date: Tue, 07 Oct 2014 23:25:53 +0200
Message-ID: <54345A61.3020809@gmx.de>
References: <5434418F.1020407@gmx.de> <20141007225009.3c74e147@marga.jer-c2.orkz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	John David Anglin <dave.anglin@bell.net>
To: Jeroen Roovers <jer@gentoo.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20141007225009.3c74e147@marga.jer-c2.orkz.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi Jeroen,

On 10/07/2014 10:50 PM, Jeroen Roovers wrote:
> On Tue, 07 Oct 2014 21:39:59 +0200
> Helge Deller <deller@gmx.de> wrote:
>
>> As already discussed here:
>> http://article.gmane.org/gmane.linux.ports.parisc/5278
>> we don't have enough RT signals for systemd, which requests
>> "SIGRTMIN+29" which is > 64 (SIGRTMAX). Since systemd gets more and
>> more important (e.g. KDE now seems to require systemd) we should try
>> to find a solution.
>
> We do have enough RT signals, as the patch attached to [1] demonstrates.

Agreed, my wording was maybe not perfect. We do have enough signals, but systemd
does has some strange expectations which you perfectly described in your bug report.

> I haven't tried that patch with recent versions of systemd, though.
> Unless systemd has started using even more signals or introduced even
> more gaps for no reason at all.

My patch brings hppa in sync with x86 and others, and those don't have more than us then.
This means we would be on the safe side :-)

>> Additionally, given the fact that we have very little users and live
>> in debian/gentoo unstable
>
> That's Debian unstable and Gentoo /stable/ thank you very much. :)

Sorry...
  
>> would IMHO justify such an incompatible change.
>
> Gentoo dropped support for GNOME and KDE years ago (except for some of
> the base libraries such as glib and gtk+ of course). The point being
> that these fat window managers run utterly slow (exactly as they do on
> much more recent x86 hardware).

It's not just the window manager. I tried to install "konsole" and this pulls in systemd.
  
> Interest in supporting systemd therefore never went beyond the
> purely academic interest displayed in [1]. Luckily, Gentoo already uses
> an alternative, modern init system. Gentoo/HPPA has little need for
> systemd, I would guess.

I think Debian will stay with sysvinit and systemd ?
  
>> The other option would be to increase NSIG in kernel from 64 to 128
>> or higher.
>
> Sounds like a lot of work.

Yes.

>> What's your opinion on this?
>
>  From my perspective it looks like a lot of work for very little gain.
> Gentoo has no need for systemd so all these changes would mean
> upgrading kernel and libc requires a lot more attention, and systemd
> could equally well compact the ill-chosen RT signal range.

As I mentioned before, I could not see any direct impact on a debian installation.
Of course I haven't tested everything, but I assume Gentoo would see similiar little
influence too.  

Helge
