Return-Path: <knaresh@india.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id DB2F4484B
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 02:46:39 -0700 (MST)
Received: from redsea.india.hp.com (redsea.india.hp.com [15.76.97.3])
	by atlrel6.hp.com (Postfix) with ESMTP id C0FEA1C0110F
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 04:46:33 -0500 (EST)
Received: from india.hp.com (eb9856.india.hp.com [15.76.98.56])
	by redsea.india.hp.com (8.9.3 (PHNE_29774)/8.9.3 SMKit7.02) with ESMTP
	id PAA15238 for <parisc-linux@lists.parisc-linux.org>;
	Tue, 27 Jan 2004 15:29:50 +0530 (IST)
Message-ID: <40163368.74DACC64@india.hp.com>
Date: Tue, 27 Jan 2004 15:16:16 +0530
From: Naresh Kumar <knaresh@india.hp.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: multipart/alternative;
	boundary="------------84804BA52793463AE6466BA0"
Subject: [parisc-linux] error?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


--------------84804BA52793463AE6466BA0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,
I noticed in the function 'linux-2.6/drivers/parisc/lba_pci.c:
lba_pat_resources( )' the following lines:

---------------------------------------------------------------
  case PAT_GMMIO:

   r = &(lba_dev->hba.gmmio_space);
   r->name   = "LBA GMMIO";
   r->start  = p->start;
   r->end    = p->end;
   r->flags  = IORESOURCE_MEM;
   r->parent = r->sibling = r->child = NULL;
   break;
   lba_dev->gmmio_base = p->start;
   break;

  case PAT_NPIOP:
    printk(KERN_WARNING MODULE_NAME
    " range[%d] : ignoring NPIOP (0x%lx)\n",
    i, p->start);
   break;
-------------------------------------------------------------------

Please note the extra lines after the 'break;'. The version of
'lba_pci.c' is 1.7. Seems to have happened due to oversight.

Thanks,
Naresh.


--------------84804BA52793463AE6466BA0
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hi,
<br>I noticed in the function 'linux-2.6/drivers/parisc/lba_pci.c: lba_pat_resources(
)' the following lines:
<p>---------------------------------------------------------------
<br>&nbsp; case PAT_GMMIO:
<p>&nbsp;&nbsp; r = &amp;(lba_dev->hba.gmmio_space);
<br>&nbsp;&nbsp; r->name&nbsp;&nbsp; = "LBA GMMIO";
<br>&nbsp;&nbsp; r->start&nbsp; = p->start;
<br>&nbsp;&nbsp; r->end&nbsp;&nbsp;&nbsp; = p->end;
<br>&nbsp;&nbsp; r->flags&nbsp; = IORESOURCE_MEM;
<br>&nbsp;&nbsp; r->parent = r->sibling = r->child = NULL;
<br>&nbsp;&nbsp; break;
<br><b><i>&nbsp;&nbsp; lba_dev->gmmio_base = p->start;</i></b>
<br><b><i>&nbsp;&nbsp; break;</i></b>
<p>&nbsp; case PAT_NPIOP:
<br>&nbsp;&nbsp;&nbsp; printk(KERN_WARNING MODULE_NAME
<br>&nbsp;&nbsp;&nbsp; " range[%d] : ignoring NPIOP (0x%lx)\n",
<br>&nbsp;&nbsp;&nbsp; i, p->start);
<br>&nbsp;&nbsp; break;
<br>-------------------------------------------------------------------
<p>Please note the extra lines after the 'break;'. The version of 'lba_pci.c'
is 1.7. Seems to have happened due to oversight.
<p>Thanks,
<br>Naresh.
<br>&nbsp;</html>

--------------84804BA52793463AE6466BA0--
