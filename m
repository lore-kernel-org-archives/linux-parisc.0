From: Grant Grundler <grundler@parisc-linux.org>
Subject: [parisc-linux] BUG 2.6.6-pa4 hang in cache_alloc_refill
Date: Wed, 2 Jun 2004 23:14:51 -0600
Message-ID: <20040603051451.GB14887@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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

Hi,
Just reporting that gsyprf11 (A500-6X) hung recently.
No ping. no console response.
No console output besides iptables LOG entries.

I TOC'd the box and took the following notes:

GR02 0x10104624 sys_call_table64+624
IIA  0x10175cdc cache_alloc_refill+274

If someone wants the entire PIM info, I can post it.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
