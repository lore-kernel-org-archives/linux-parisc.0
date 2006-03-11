From: =?ISO-8859-1?Q?Vincent_Stehl=E9?= <vincent.stehle@free.fr>
Subject: Re: [parisc-linux] Bug report: 2.6.15 crash when accessing nbd on
	a 712.
Date: Sat, 11 Mar 2006 21:30:15 +0100
Message-ID: <44133357.3070104@free.fr>
References: <440CB949.7040706@free.fr>
	<20060309154750.GA11249@quicksilver.road.mcmartin.ca>
	<20060309174841.GA26062@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060309174841.GA26062@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Kyle, Grant,

I took your -pa4 patch, applied it over the debian 2.6.15 sources, 
recompiled with nbd and it works fine. I can now swap over nbd.

Thank you very much for your help!

-- 
Vincent Stehlé
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
