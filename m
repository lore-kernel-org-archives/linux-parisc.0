Return-Path: <hppa-linux@puffingroup.com>
Date: Fri, 19 Feb 1999 15:33:49 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: hppa-linux@puffingroup.com
cc: jason@equator.com
Subject: Re: [hppa-linux] Partitioning proposal for boot loader
In-Reply-To: <199902191929.NAA11346@equator.com>
Message-ID: <Pine.LNX.3.96.990219152738.6631W-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"chTnz2.0.jX7.AkSps"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org


On Fri, 19 Feb 1999, Jason Eckhardt wrote:
> As I mentioned in previous mailings, the bootloader needs to understand how
> to find the kernel on the disk. 
> I propose that for the near-term, we use a simple PC-like partition scheme
> for HPPA/Linux. In the future, once Linux is up and running,
> we can work on co-existing with HP-UX on the same physical disk (see below
> for more on this). This will keep the bootloader very small and simple,
> and allow us to quickly move to working on the hard part, the actual kernel.

I think your order of doing first pc-like partitioning then hpux
partitioning is correct, but I think that partitioning itself isn't needed
right away.

To start, I'm really much keener on net booting.  This is because the
kernels will be cross compiled on other machines, and it lets us get
straight to the testing, and we don't need any disk reading or anything
like that.

But certainly sorting these partitioning issues out will be important down
the line.


> My idea is to create simple partition table structure which would contain
> (for each partition) the starting sector, length, and perhaps a flag word.
> This table would be of fixed length (say 16 entries) and be stored at a
> known place near the beginning of the disk.

I'd much rather use an existing paritioning structure if at all possible.

- Alex

----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
