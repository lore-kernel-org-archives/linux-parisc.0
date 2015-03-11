From: John David Anglin <dave.anglin@bell.net>
Subject: BUG: non-zero nr_pmds on freeing mm: -1
Date: Tue, 10 Mar 2015 22:44:17 -0400
Message-ID: <BLU436-SMTP11459F3D9DC424BE50626A797190@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset="us-ascii"
To: linux-parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

With 4.0.0-rc3+ #1 SMP, I get hundreds of these BUG messages:
BUG: non-zero nr_pmds on freeing mm: -1

However, system does boot.

Dave
--
John David Anglin	dave.anglin@bell.net



