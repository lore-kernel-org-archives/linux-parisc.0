Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47F56482A
	for <parisc-linux@parisc-linux.org>; Tue, 22 Jan 2002 07:23:10 -0700 (MST)
Date: Tue, 22 Jan 2002 14:12:53 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Matt.VanDeWerken@csiro.au
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Trouble installing 0.9.3 on 735/99
Message-ID: <20020122141253.GB25314@sleepie.demon.co.uk>
References: <A8566E157F5FD411BCFB00D0B7816D51C72CD9@ntexchange.cat.csiro.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <A8566E157F5FD411BCFB00D0B7816D51C72CD9@ntexchange.cat.csiro.au>
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

On Tue, Jan 22, 2002 at 07:58:22AM +1000, Matt.VanDeWerken@csiro.au wrote:
> Hi all:
> 
> * drop to shell, do "mkdir /inst ; mount /dev/sdb /inst -t iso9660"
> 
> Note that this last step only sometimes works. That is, only sometimes does
> the install program see the mounted directory.

Are you confident that you are terminating the external scsi bus
properly?  0.9.2 ISO used an older slower scsi driver that was possibly
less susceptible to bad termination.

Richard
