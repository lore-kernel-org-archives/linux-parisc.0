Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x1.nokia.com (mgw-x1.nokia.com [131.228.20.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A3A44829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 07:58:14 -0700 (MST)
Received: from esvir05nok.ntc.nokia.com (esvir05nokt.ntc.nokia.com [172.21.143.37])
	by mgw-x1.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h0AEvE003075
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 16:57:14 +0200 (EET)
Received: from esebh003.NOE.Nokia.com (unverified) by esvir05nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5fb56f9b3fac158f25441@esvir05nok.ntc.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Fri, 10 Jan 2003 16:58:03 +0200
Received: (from mnahkola@localhost)
	by aurinko.ntc.nokia.com (8.11.6/8.11.6) id h0AEw1913974
	for parisc-linux@lists.parisc-linux.org; Fri, 10 Jan 2003 16:58:02 +0200 (EET)
Date: Fri, 10 Jan 2003 16:58:00 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ibm-disk on a hp 735/125
Message-ID: <20030110145800.GH2160@aurinko.ntc.nokia.com>
References: <Pine.GSO.4.51.0301091743500.9837@sunhalle66> <20030110124210.GG2160@aurinko.ntc.nokia.com> <1042203531.19627.11.camel@linux>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <1042203531.19627.11.camel@linux>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Fri, Jan 10, 2003 at 01:58:51PM +0100, ext Joerg Krebs wrote:
> Am Fre, 2003-01-10 um 13.42 schrieb Nahkola Mikko:

> > > im running a hp 735/125 with a st31200wd 1GB harddisk, connected to the
> > > fast-wide scsi-connector, which run's quit nice.
> > > But now I want to replace the disk with a larger 4,3GB ibm dcas-34330

> > I'd say that probably the IBM disk isn't high-voltage. The 735's 
> > fast-wide is fast-wide-highvoltage-differential, back then they thought 

> Yes you are right, I found the HP 735 Hardware manual on the openpa
> Webside and there i found that the wide-scsi connector is just for HVD
> Do you know if any HVD disk is detected by the hp or are there just some
> special disks for the hp ?

Well, yes on both counts. Any HVD disks should be detected... but at the 
time these boxes were made, there were supposed to be certain differences 
between HP and regular disks. Or maybe that was just HP marketing.

At any rate, there _was_ (and still is, BTW) a way to recognize a HP disk 
by the firmware - and there were differences between "workstation" and 
"server" disks too, _and_ IIRC "workstation" disks weren't "expected to 
work" in servers, the other way round it was "expected to work" but "unsupported" 
or something. Don't remember.

If I only could remember what the exact identification thing was ... 
maybe a letter somewhere in the firmware version string.

But since HP-UX 10.20 by the latest, probably earlier too, some people 
have been using whatever disks they get as long as the SCSI interfaces 
are compatible. I've never heard of problems. 

Me? I recycle old HP disks in PCs... 


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
