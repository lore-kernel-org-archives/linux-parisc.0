Return-Path: <deller@gmx.de>
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 4A2B0487B
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Dec 2003 13:47:02 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] strange GNU ld / libgcc_s.so problems
Date: Mon, 15 Dec 2003 21:46:44 +0100
References: <200312141209.28283.deller@gmx.de>
	<20031214221629.GZ13882@systemhalted>
In-Reply-To: <20031214221629.GZ13882@systemhalted>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200312152146.44613.deller@gmx.de>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sunday 14 December 2003 23:16, Carlos O'Donell wrote:
> On Sun, Dec 14, 2003 at 12:11:07PM +0100, Helge Deller wrote:
> > Below is the output and I don't understand the part which I marked with "######".
> > Why does collect2 suddenly tries to resolve libstdc++.so while it searched for 
> > libgcc_s.so ? All other libraries (e.g.-lutil) behave IMHO normal.
> > Any ideas ? This seems to me like a bug in gcc 3.3.2, but I'm no expert here.
> > 
> ... SNIP ...
> 
> > attempt to open /usr/X11R6/lib/libgcc_s.so failed
> > attempt to open /usr/X11R6/lib/libgcc_s.a failed
> > attempt to open /opt/kde/qt/lib/libgcc_s.so failed
> > attempt to open /opt/kde/qt/lib/libgcc_s.a failed
> > attempt to open /opt/kde/lib/libgcc_s.so failed
> > attempt to open /opt/kde/lib/libgcc_s.a failed
> > attempt to open /usr/lib/libgcc_s.so succeeded
> > -lgcc_s (//usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume@GCC_3.0'
> > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Register@GCC_3.0'
> > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_RaiseException@GCC_3.0'
> > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Unregister@GCC_3.0'
> > /usr/lib/libstdc++.so: undefined reference to `_Unwind_SjLj_Resume_or_Rethrow@GCC_3.3'
> > usr/lib/libgcc_s.so)
> > 
> > ##### ^^^ Why does /usr/lib/libstdc++.so comes into the game here ?
> > ##### The double "//" seems suspect too, since it continues with "usr/lib/libgcc_s.so" 
> > ##### in the last line without the trailing "/". It seems this "string" was broken up
> > ##### right in the middle....
> 
> Where did that file come from? Is this a debian box?
> You should have:
> 
> /usr/lib/gcc-lib/hppa-linux/<gcc-version>/libgcc_s.so
> pointing to /lib/libgcc_s.so

Yes - Debian box and correct symlink.

> I suggest you try building this in a clean unstable chroot :)

:-)

Thanks,
Helge
