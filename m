Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF26D4866
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Sep 2003 11:58:17 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A1Uwy-0001FR-Lc; Mon, 22 Sep 2003 18:58:16 +0100
Date: Mon, 22 Sep 2003 18:58:16 +0100
From: Matthew Wilcox <willy@debian.org>
To: "SUDARSANAN,RANJITH (HP-India,ex2)" <ranjith_sudarsanan@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Problem with SCSI_IOCTL_GET_PCI ioctl
Message-ID: <20030922175816.GW13172@parcelfarce.linux.theplanet.co.uk>
References: <A11077E28200D51182EA00D0B775525309AA614D@xin02.india.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <A11077E28200D51182EA00D0B775525309AA614D@xin02.india.hp.com>
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

On Mon, Sep 22, 2003 at 10:43:00PM +0530, SUDARSANAN,RANJITH (HP-India,ex2) wrote:
> I traced this error down to ioctl32.c line no. ~ 3056 to 3063
> 
> /* Big S */
> COMPATIBLE_IOCTL(SCSI_IOCTL_GET_IDLUN)
> COMPATIBLE_IOCTL(SCSI_IOCTL_DOORLOCK)
> COMPATIBLE_IOCTL(SCSI_IOCTL_DOORUNLOCK)
> COMPATIBLE_IOCTL(SCSI_IOCTL_TEST_UNIT_READY)
> COMPATIBLE_IOCTL(SCSI_IOCTL_TAGGED_ENABLE)
> COMPATIBLE_IOCTL(SCSI_IOCTL_TAGGED_DISABLE)
> COMPATIBLE_IOCTL(SCSI_IOCTL_GET_BUS_NUMBER)
> COMPATIBLE_IOCTL(SCSI_IOCTL_SEND_COMMAND)
> COMPATIBLE_IOCTL(SCSI_IOCTL_GET_PCI) 		/*This entry is missing in
> the ioctl translation table*/
> /* Big V */
> COMPATIBLE_IOCTL(VT_SETMODE)
> COMPATIBLE_IOCTL(VT_GETMODE)
> COMPATIBLE_IOCTL(VT_GETSTATE)
> COMPATIBLE_IOCTL(VT_OPENQRY)
> 
> The above entry fixed the problem. I am surprised that ioctls code wasn't
> tested. When I see the code. This seems to be the last ioctl which was
> added.
> 
> I am not sure if I should post this here, please let me know if I am wrong.

Right place to post it, right fix.  Patch committed as 2.4.22-pa8.
Could you send it in the form of a unified diff next time?  eg:

cvs diff -u arch/parisc/kernel/ioctl32.c

Thanks.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
