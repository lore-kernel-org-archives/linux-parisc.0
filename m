From: "B. Douglas Hilton" <bdhilton@charter.net>
Subject: Re: [parisc-linux] X-Terminal?
Date: Wed, 28 Aug 2002 21:13:11 -0400
Message-ID: <3D6D7527.5040505__11769.3984102972$1416621656$gmane$org@charter.net>
References: <005801c24ef5$bcd5d6c0$95ff8450@PLUTO> <1030582666.2179.360.camel@archimedes.localnetsolutions.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
To: palinux <parisc-linux@lists.parisc-linux.org>,
	debian-hppa@lists.debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I agree. Cygwin with XFree86 has got to be the ultimate,
heck you should always have Cygwin anyways on any Windoze
box IMHO, and XFree86 wasn't a big deal to install the
last time I tried it. You should be able to use the
xterm to telnet or rlogin to the hppa box and then an

$ export DISPLAY=###.###.###.###:0
$ mozilla &

Should work most excellently, although I have run into
some difficulties running X apps remotely a while back
with Debian, something seemed messed up with my security
settings and the Debian box wasn't allowing apps to run
remotely. Haven't tried it in a while so I dunno if it
has been fixed or is some config problem on my side.

Voodoo2 Update - been real busy and real tired, no time
to screw with it right now. Probably will hack on it
this weekend.

- Doug




James P. Kinney III wrote:
> Cygwin with XFree86 4.x support! As a demo I ran KDE under Win98 on
> cygwin. Slow, but it worked.
> 
> The twm is rather speedy. 
> 
> 
> http://www.cygwin.com
> 
> On Wed, 2002-08-28 at 20:48, Tobias Giesen wrote:
> 
>>Hello,
>>
>>while I can't get X on my C200 to support the graphics card, how about
>>using an X-Terminal via Ethernet?
>>
>>Where can I get hints on how to configure this, and
>>
>>does anybody know a good X-Window-Terminal software for MS Windows?
>>
>>Cheers,
>>Tobias
