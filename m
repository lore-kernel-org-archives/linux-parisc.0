Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server3.thinmail.com (server3.thinmail.com [64.39.29.150])
	by dsl2.external.hp.com (Postfix) with ESMTP id E15CA611F
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Nov 2001 16:19:37 -0700 (MST)
Received: (from root@localhost)
	by server3.thinmail.com (8.9.3/8.9.3) id OAA23021
	for parisc-linux@lists.parisc-linux.org; Sun, 18 Nov 2001 14:12:02 -0600
Received: from hermes.cs.brandeis.edu (IDENT:root@hermes.cs.brandeis.edu [129.64.2.5])
	by server3.thinmail.com (8.9.3/8.9.3) with ESMTP id OAA22990
	for <parisc-linux@lists.parisc-linux.org.ml.to>; Sun, 18 Nov 2001 14:11:07 -0600
Received: from [129.64.46.46] ([129.64.46.83])
	by hermes.cs.brandeis.edu (8.11.6/8.9.3) with ESMTP id fAIJxok01210
	for <parisc-linux@lists.parisc-linux.org.ml.to>; Sun, 18 Nov 2001 14:59:50 -0500
Message-Id: <a05100318b81dbd449750@[129.64.46.46]>
In-Reply-To: <1006107893.4898.5.camel@beavis>
References: <a05100316b81d8d1c41f3@[129.64.46.46]>
 <1006107893.4898.5.camel@beavis>
Date: Sun, 18 Nov 2001 14:34:30 -0500
Subject: Re: [parisc-linux] 755/125 problems
To: parisc-linux@lists.parisc-linux.org
From: Aaron Macks <aaronm@cs.brandeis.edu.ml.to>
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

Ok, so the Root pw of HPUX has been fixed, thanks.  I was able to 
unconfigure the ATM card and remove it from the eisa cage, but the 
system still seems not to see the 10baseT AUI adaptor, no lights are 
lit, not even the power one.
As for SCSI, I have HPUX on a FW, but a N for Linux.  Will it be a 
problem to have the FW drive installed, or Linux just ignore it?
Aaron

-- 
_______________________________________________________
Aaron Macks(aaronm@cs.brandeis.edu)
My sheep has seven gall bladders, that makes me the King of the Universe!
