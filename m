Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp10.atl.mindspring.net (smtp10.atl.mindspring.net [207.69.200.246])
	by dsl2.external.hp.com (Postfix) with ESMTP id ADA98482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 May 2002 18:05:44 -0600 (MDT)
Received: from user-119b1cf.biz.mindspring.com ([66.149.133.143] helo=castle.localnetsolutions.com)
	by smtp10.atl.mindspring.net with esmtp (Exim 3.33 #1)
	id 178VFe-0000PN-00
	for parisc-linux@lists.parisc-linux.org; Thu, 16 May 2002 20:05:42 -0400
Received: from archimedes.localnetsolutions.com (archimedes.localnetsolutions.com [192.168.0.2])
	by castle.localnetsolutions.com (8.11.6/linuxconf) with ESMTP id g4H06BT02058
	for <parisc-linux@lists.parisc-linux.org>; Thu, 16 May 2002 20:06:11 -0400
Subject: Re: [parisc-linux] booting to single user mode?
From: "James P. Kinney III" <jkinney@localnetsolutions.com>
Cc: palinux <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <1021593568.2584.78.camel@archimedes.localnetsolutions.com>
References: <1021593568.2584.78.camel@archimedes.localnetsolutions.com>
Content-Type: text/plain
Date: 16 May 2002 20:05:42 -0400
Message-Id: <1021593942.1992.80.camel@archimedes.localnetsolutions.com>
Mime-Version: 1.0
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

Answered it myself. Append "single" to the last line and boot up.

On Thu, 2002-05-16 at 19:59, James P. Kinney III wrote:
> I goofed and installed something I shouldn't have (x10) and now it
> completely hangs the init process. How to I pass a "boot to single user
> mode" parameter from the IPL/PALO loader?
> -- 
> James P. Kinney III   \Changing the mobile computing world/
> President and CEO      \          one Linux user         /
> Local Net Solutions,LLC \           at a time.          /
> 770-493-8244             \.___________________________./
> 
> GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
> <jkinney@localnetsolutions.com>
> Fingerprint = 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7 
> 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
-- 
James P. Kinney III   \Changing the mobile computing world/
President and CEO      \          one Linux user         /
Local Net Solutions,LLC \           at a time.          /
770-493-8244             \.___________________________./

GPG ID: 829C6CA7 James P. Kinney III (M.S. Physics)
<jkinney@localnetsolutions.com>
Fingerprint = 3C9E 6366 54FC A3FE BA4D 0659 6190 ADC3 829C 6CA7 
