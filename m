Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mgw-x1.nokia.com (mgw-x1.nokia.com [131.228.20.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id 065604829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 05:42:23 -0700 (MST)
Received: from esvir05nok.ntc.nokia.com (esvir05nokt.ntc.nokia.com [172.21.143.37])
	by mgw-x1.nokia.com (Switch-2.2.1/Switch-2.2.0) with ESMTP id h0ACfN017499
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 14:41:23 +0200 (EET)
Received: from esebh002.NOE.Nokia.com (unverified) by esvir05nok.ntc.nokia.com
 (Content Technologies SMTPRS 4.2.5) with ESMTP id <T5fb4f34022ac158f25441@esvir05nok.ntc.nokia.com> for <parisc-linux@lists.parisc-linux.org>;
 Fri, 10 Jan 2003 14:42:13 +0200
Date: Fri, 10 Jan 2003 14:42:10 +0200
From: Nahkola Mikko <mnahkola@trinms01.ntc.nokia.com>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ibm-disk on a hp 735/125
Message-ID: <20030110124210.GG2160@aurinko.ntc.nokia.com>
References: <Pine.GSO.4.51.0301091743500.9837@sunhalle66>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <Pine.GSO.4.51.0301091743500.9837@sunhalle66>
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

On Thu, Jan 09, 2003 at 05:44:31PM +0100, ext Joerg Krebs wrote:

> im running a hp 735/125 with a st31200wd 1GB harddisk, connected to the
> fast-wide scsi-connector, which run's quit nice.
> But now I want to replace the disk with a larger 4,3GB ibm dcas-34330
> disk, but I can't get it be detected by the system, I think i used the
> same jumper settings as on the old seagate drive.
> at the search for potential boot devices nothing appears.

I'd say that probably the IBM disk isn't high-voltage. The 735's 
fast-wide is fast-wide-highvoltage-differential, back then they thought 
that no one in their right minds would try to do FWSE and no one had 
thought about LVD yet, or something...

And IIRC the -wd in the Seagate model code means about that too. I don't 
know about IBM specifically.

> So perhaps someones uses the same harddisk and can tell me the right
> jumper-settings, the disk itself works fine with a normal PC with a
> scsi-wide controller.

Well, if it works in a normal PC, that usually means that it isn't HVD. I 
only know of two HVD adapters for PCs, Adaptec AHA-1744 and 2944, and 
those were always expensive ...

I suppose you could get the disk to work on a single-ended interface or 
get an appropriate EISA card.

Besides, do you mean that the 735 FWD interface works in Linux/parisc 
nowadays? Great... 


-- 
Mikko Nahkola   <mikko.nahkola@nokia.com>
Tre-IN sysadmin <mnahkola@trein.ntc.nokia.com>
