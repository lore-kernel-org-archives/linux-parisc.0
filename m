Return-Path: <JKonrad@linotype.com>
Received: from mail.linotype.com (www.typomedia.com [213.61.7.196])
	by dsl2.external.hp.com (Postfix) with ESMTP id B958F486A
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Apr 2004 01:03:15 -0600 (MDT)
Subject: Antwort: Re: [parisc-linux] Problem with SCSI in K-Class
To: Grant Grundler <grundler@parisc-linux.org>
Message-ID: <OF1931B962.0F35B8A0-ONC1256E78.002649CA@fonts.de>
From: JKonrad@linotype.com
Date: Fri, 16 Apr 2004 09:02:15 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=us-ascii
Cc: Jens_Konrad/Linotype/DE@linotype.com,
	parisc-linux-bounces@lists.parisc-linux.org,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


Hi,

that is a relief :-)) I desperately need these 50GB in this machine.

Well:

it is 2.4.23-pa3, I downloaded the kernel from  http://parisc-linux.org/~rbrad/vmlinux-2.4.23-pa3.bz2 because I needed a kernel supporting Mux. I have not yet built my own kernel, not sure if that
might help.

Since I have three CPUs in this machine, I was planning on building my own kernel anyway. Maybe I should do so, do you think this will help???

Greets,

Jay



                                                                                                                                                                      
                      Grant Grundler                                                                                                                                  
                      <grundler@parisc-linux.org>             An:       Jens_Konrad/Linotype/DE@linotype.com                                                          
                      Gesendet von:                           Kopie:    parisc-linux@lists.parisc-linux.org                                                           
                      parisc-linux-bounces@lists.paris        Thema:    Re: [parisc-linux] Problem with SCSI in K-Class                                               
                      c-linux.org                                                                                                                                     
                                                                                                                                                                      
                                                                                                                                                                      
                      16.04.2004 01:33                                                                                                                                
                                                                                                                                                                      
                                                                                                                                                                      




On Thu, Apr 15, 2004 at 09:04:59PM +0200, Jens_Konrad/Linotype/DE@linotype.com wrote:
> Now I took away the streamer and replaced it with a 50GB SCSI...
...
> My guess is that the low voltage scsi-controller cannot handle the
> size of the HD - could that be??

No. I'm using 73GB drives on my C3000 w/no problem.
Something else is wrong related to the driver stack.
Ryan already asked the obvious question: which kernel version?

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
