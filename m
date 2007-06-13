From: Julian Stecklina <der_julian@web.de>
Subject: Re: [parisc-linux] Status of parport driver in 2.6.20.1
Date: Wed, 13 Jun 2007 19:17:14 +0200
Message-ID: <4670269A.1080703__42853.3024540686$1416624392$gmane$org@web.de>
References: <466F3706.3020907@web.de> <466FB64A.5020800@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <466FB64A.5020800@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Randolph Chung wrote:
>> I am running a 2.6.20.1 kernel on a C3600 workstation and want to hook 
>> up a printer to the parallel port. But modprobe'ing parport-pc or 
>> parport-serial gives me:
> 
> I think this uses suckyio. Can you post your boot log somewhere? I don't 
> know if anybody has tried this recently but it did work at some point.
> 
> Also, output of lspci -v and cat /proc/interrupts may be helpful
> 
> For HPMC, you can recover the some trace data from the boot console. See 
> http://www.parisc-linux.org/faq/kernelbug-howto.html

I have build a kernel with parport support (the first try was with 
parport as module) and was able to get a backtrace:

http://web.inf.tu-dresden.de/~s1054849/dmesg.and.hpmc.txt
http://web.inf.tu-dresden.de/~s1054849/pci.txt

The latter is from the same kernel without parport.

Regards,
Julian
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
