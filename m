From: rray@tcmail.mstc.state.ms.us
Subject: [parisc-linux] Kernel 2.6.8 compile bomb...
Date: Thu, 2 Dec 2004 08:48:47 -0600 (CST)
Message-ID: <Pine.LNX.4.58.0412020842550.10014@rray.drdc.mstc.ms.gov>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I'm getting the same results with 2.6.9 I got from kernel.org.
I left all of the "stock" setting. SOM support is off.
I just intalled Debian on a K200 yesterday. Everythings working except
peripherals.

Thanks
Richard Ray


>> I submit the compile session to the gurus on the list to see what I
>> might be doing wrong... :-)
>
> this is a real bug, but HPUX support is currently not working anyway, so
> if you turn that off, (SOM support) it should build.
>
> randolph
> --
> Randolph Chung
> Debian GNU/Linux Developer, hppa/ia64 ports
> http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
