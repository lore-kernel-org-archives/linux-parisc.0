Return-Path: <hppa-linux@thepuffingroup.com>
Message-ID: <7678BED5A989D211A39000A0C94309E908D624@wehcml06>
From: PG40 KCLin <KCLIN@winbond.com.tw>
To: "'hppa-linux@thepuffingroup.com'" <hppa-linux@thepuffingroup.com>
Subject: RE: [hppa-linux] New cross compiling RPMs
Date: Fri, 12 Mar 1999 10:57:38 +0800
MIME-Version: 1.0
Content-Type: text/plain
Resent-Message-ID: <"cMD701.0.-x2.sB8ws"@sod.res.cmu.edu>
Reply-To: hppa-linux@thepuffingroup.com
List-Id: linux-parisc.vger.kernel.org

About the source level remote debugger of Windows based version for GNU
cross tools, please reference the web site: http://www.cygnus.com then you
may get more idea about it.

Winbond is one IC maker in Taiwan. We developed the PA-RISC 1.1 architecture
level 0 controller and focus in Embedded controller market. We using the
cross tools (DOS or DOS prompt in Windows based running on PC) provided by
CYGNUS. If you've interested about our chip spec. or develop platform,
please reference our web site at http://www.winbond.com.tw -> select product
overview -> select product information -> select Visual Communication ICs ->
select Embedded Controller then you'll get the chip information and
evaluation kits information.

Because we're interesting the Linux kernel can be run on our platform, if we
can have any contribution in your porting project, please let me know.
Thanks!

Best regards,
James K.C. Lin
Winbond Electronics Corp.
Taiwan, R.O.C.

> ----------
> From: 	Alex deVries[SMTP:adevries@redhat.com]
> Sent: 	Thursday, March 11, 1999 AM 11:18
> To: 	'hppa-linux@thepuffingroup.com'
> Subject: 	RE: [hppa-linux] New cross compiling RPMs
> 
> 
> On Thu, 11 Mar 1999, PG40 KCLin wrote:
> > About the new cross compiler, does it support floating-point emulation
> for
> > PA-RISC 1.1 architecture level 0? In the cross tool, does it support the
> > source level debugger based on Windows? or gdb only?
> 
> I'm not actually quite sure about the answer to this question; certainly
> their is no native floating point support, although there may be
> emulation.
> 
> This should be easy enough to test.
> 
> For the kernel side of things, which is the most immediate concern, we
> don't need floating point yet anyway.
> 
> There's currently no working gdb, although that shouln't be too difficult
> to straighten out either.  I don't know what you mean by the source level
> windows debugger, but I'm interested.
> 
> -= Alex
> 
> -- 
> Alex deVries <puffin@redhat.com>     
> Red Hat Contrib Net maintainer          
> Ottawa, Canada  
> HPPA/Linux Porting Team
> 
> 
> 
> -------------------------------------------------------------------------
> To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.
> 

-------------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@thepuffingroup.com with
`unsubscribe' as the subject.
