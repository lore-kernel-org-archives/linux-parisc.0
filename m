From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] HP model 612 hard disk not found
Date: Sat, 26 Feb 2005 11:56:26 -0700
Message-ID: <20050226185626.GC16927@colo.lackof.org>
References: <200502251214.15993.mszick@wolfbutter.com>
	<20050226162901.GA26100@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: "Michael S. Zick" <mszick@wolfbutter.com>,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050226162901.GA26100@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Feb 26, 2005 at 11:29:01AM -0500, John David Anglin wrote:
> > > But nothing works. 
> > > How can i mount it. It has a filesystem of HP-UX.
> > > fdisk command doesn't exist
> 
> I don't believe that there is support to directly mount HP-UX file
> systems (i.e., hfs or vxfs).  One way might be using nfs.

UFS works for HPUX disks the last time I tried it a few years ago.

But, HPUX LVM is incompatible with linux LVM.
Ie the HPUX "HFS" (aka UFS) must be "whole disk".

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
