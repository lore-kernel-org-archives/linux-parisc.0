From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Easy Firmware Upgrade for C180
Date: Sat, 26 Mar 2005 15:12:03 -0700
Message-ID: <20050326221203.GC9287@colo.lackof.org>
References: <913ffb071295fac86a0aade164cf5a27@cox.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: "Erik T.Crouch" <lennier@cox.net>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <913ffb071295fac86a0aade164cf5a27@cox.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Mar 26, 2005 at 10:25:10AM -0600, Erik T.Crouch wrote:
> Ok, the HP instructions are wacky saying to use a tape writing the 
> image via dd.

The same LIF image that can be dd'd to tape can be written to a
hard disk or netbooted (using DHCP and TFTP, IIRC).

> Is there ANY way of making the firmware image extractable/writable to a 
> CD, I also do not have a floppy drive.

I don't know.
See PALO documentation in:
	http://www.tldp.org/HOWTO/PA-RISC-Linux-Boot-HOWTO/index.html

It's been easier for me to dd to a hard disk (or netboot) than figure out
how to make/burn bootable parisc CDs. :^)

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
