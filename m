Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F695484D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 10:30:41 -0700 (MST)
Received: from npyu.esiee.fr (npyu.esiee.fr [147.215.80.150])
	by mail.esiee.fr (Postfix) with ESMTP id C6DE549BEB
	for <parisc-linux@lists.parisc-linux.org>; Tue, 12 Mar 2002 18:30:39 +0100 (CET)
Date: Tue, 12 Mar 2002 18:08:38 +0100
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Resent-Message-Id: <CBC154D3-35DB-11D6-B413-0030656F07A2@esiee.fr>
To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0 (Apple Message framework v481)
Subject: Re: [parisc-linux] dynamic loader problem
From: Thibaut VARENE <varenet@esiee.fr>
Message-Id: <DF1D3A62-35DE-11D6-B413-0030656F07A2@esiee.fr>
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

Le mardi 12 mars 2002, =E0 05:46 , Randolph Chung a =E9crit :

>> Has anybody worked on the various "dl-" routines in =
glibc/sysdeps/hppa
>> recently?  That's probably where the dynamic loader problem lies.
>
> afaik ESIEE guys are looking at glibc.... thibaut? clement? any=20
> comments?
>
Well we're actually trying to rewrite the dynamic symbol resolver=20
following the ia64 model -- this should result in a significant speedup.=20=

(according to ACM)

We're currently focusing on the last point, so if we succeed, it might=20=

solve the problem (assuming it works fine on ia64).

We will keep the m-l informed of the progress of our work...


Thibaut VARENE
PA/Linux ESIEE Team
http://www.esiee.fr/puffin
