Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Disk problems 
In-Reply-To: Message from Derek Engelhaupt <derekengelhaupt@rocketmail.com>
   of "Mon, 25 Nov 2002 12:12:22 PST." <20021125201222.87249.qmail@web12501.mail.yahoo.com>
References: <20021125201222.87249.qmail@web12501.mail.yahoo.com> 
Date: Mon, 25 Nov 2002 14:07:33 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021125210733.1E89A4829@dsl2.external.hp.com>
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
> If it works in a mac, the low-level formatting is probably ok. It's
> most likely the data in block 0 or possibly some of the vendor info
> that's the problem. You should also examine all switch settings and
> check that the termination is correct.

I privately speculating the nwe disk FW talks to the host differently.
ie it might disconnect/reconnect or send "msg" when the SCSI driver
is expecting something else. That at least would explain why mac or
hpux can deal with the disk but linux can't.

grant
