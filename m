From: Anders <dizzey@ing.umu.se>
Subject: [parisc-linux] k-class smp_call_function at
	arch/parisc/kernel/smp.c:340
Date: Mon, 28 Mar 2005 14:27:49 +0200
Message-ID: <20050328122749.GB12853@ing.umu.se>
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

well i got help with the ccio-dma problem.
but now i get smp badness.

kernel 2.6.12-rc1-pa4 with a little ccio fix 
gcc version 3.3.5

bootlog can be found at 
www.ing.umu.se/~dizzey/k460_bootlog


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
