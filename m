From: Kurt Fitzner <kfitzner@excelcia.org>
Subject: Re: [parisc-linux] Infinite error message from SDC driver on install
Date: Sat, 09 Jul 2005 15:50:04 -0600
Message-ID: <42D0468C.5010005@excelcia.org>
References: <42CF1766.8030608@excelcia.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <42CF1766.8030608@excelcia.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I have found that if I switch to a serial console that after a variable
(from 1 to 50) number of "Transaction add failed" error messages that a
timeout error would occur and no further transaction errors will occur.
This allows me to install Debian.

After installation if I continue to boot with a serial console then I
can boot the Debian installation.  If I try to boot with the standard
graphics console, however, I have a new problem with the SDC driver.
During boot when the SDC driver initializes, it issues the following
message:

"HP SDC MLC: Registering the System Domain Controller's HIL MLC."

After the above message, the kernel hangs and booting is not possible.

I am at my wit's end with this one.  I would really appreciate any
insight that could be offered.

Regards,

    Kurt Fitzner

p.s. In case it is relevant, machine specs are as follows:
HP 9000 B132L workstation
128 MB RAM
Seagate 4.3GB drive on fwscsi.6.0
Panasonic cdrom on sescsi.3.0
No EISA or PCI cards installed.

Kurt Fitzner wrote:
> I have just recently attempted to install Debian 3.1 on an old B132L.  I
> have managed to get the install CD to boot, but the kernel is issuing an
> infinite stream of error messages from the SDC driver:
> 
> "HP SDC: Transaction add failed: transaction already queued?"
> 
> At first this was preventing the install CD from booting.  I determined
> this was due to syslogd filling the ramdisk by logging the above
> message.  I was able to get the install CD to boot into the installation
> by making the initial ramdisk size very large (64 meg).  However, even
> this fills up withing a few minutes.
> 
> I'm not very familliar with the SDC - is there a way to prevent the
> above from occuring?
> 
> Thanks in advance,
> 
> 	Kurt Fitzner
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
