Return-Path: <hppa-linux@puffingroup.com>
From: Richard "J." Rauenzahn <rrauenza@cup.hp.com>
Message-Id: <199902161835.KAA23022@hairball.cup.hp.com>
Subject: Re: [hppa-linux] Booting issues.
To: hppa-linux@puffingroup.com
Date: Tue, 16 Feb 1999 10:35:07 -0800 (PST)
In-Reply-To: <Pine.LNX.3.96.990216121507.22132J-100000@devserv.devel.redhat.com> from Alex deVries at Feb "16," 1999 "12:18:00" pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Resent-Message-ID: <"UEkaj.0.6m4.8hRos"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org

> Right.  We should look at getting Linux to be able to write to LIF
> volumes.  I imagine the structure is reasonably simple.
> 
> How do you write to a LIF volume from hpux right now?

The tools are included in the OS..

$ man -k lif
instl_combine(1M)       - Combine a LIF file and file system for use on CD-ROM
lif(4)                  - logical interchange format description
lifcp(1)                - copy to or from LIF files
lifinit(1)              - write LIF volume header on file
lifls(1)                - list contents of a LIF directory
lifrename(1)            - rename LIF files
lifrm(1)                - remove a LIF file

> That shouldn't be too difficult; I'm told HPUX uses BSD 4.2 filesystems,
> which I think we have drivers for already.

They probably were referring only to HFS filesystems (which is the only
FS we support booting the kernel off of).  I suspect JFS (Journaled)
(a.k.a.  VXFS (Veritas)) is nothing like BSD 4.2.

> Thanks for the pointers.

May none of them be null =-)

Rich

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
