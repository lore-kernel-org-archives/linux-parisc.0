Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Autoraid supported? 
In-Reply-To: Message from Derek Engelhaupt <derekengelhaupt@rocketmail.com>
   of "Wed, 14 Aug 2002 17:11:33 PDT." <20020815001133.84971.qmail@web12507.mail.yahoo.com>
References: <20020815001133.84971.qmail@web12507.mail.yahoo.com> 
Date: Thu, 15 Aug 2002 00:18:03 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020815061803.7FFD54829@dsl2.external.hp.com>
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

Derek Engelhaupt wrote:
> Being an HP-UX man I was wondering how Debian handles alternate (pv) links?

YMMV. The dual controller FC10 confused the shit out of the
Emulex lpfc driver. lpfc just doesn't know the FC10 might take
5-10 (or more)  seconds to reassign LUNs from one controller
to the other.  I don't expect much better from the SCSI stack
but it will depend on the interface driver.

...
> Normally on my HP-UX side I would hook up the AutoRAID, do an ioscan
> -f, insf -e, and proceed to pvcreate/vgcreate/lvcreate, etc.  Since
> there is no ioscan in Linux, how can you do a physical scan of the
> hardware?

At boot time, such a scan takes place.
You can look in /proc/scsi/scsi to see which SCSI devices have
been discovered.

> Any hardware diagnostics?  Or if anyone can point me to some
> other online resources that might be helpful, that would be great too. 
> Thanks....

See Debian scsitools and scsiadd packages.
Also learn about mounting file systems by label rather than
by device name

grant
