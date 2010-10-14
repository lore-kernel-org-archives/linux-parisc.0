From: Kyle McMartin <kyle@hera.kernel.org>
Subject: [git] parisc: Changes to ref refs/heads/parisc
Date: Thu, 14 Oct 2010 01:15:35 +0000
Message-ID: <201010140115.o9E1FZhT002187@hera.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Rebased ref, commits from common ancestor:
commit 15b612c28d7144cf25f191a2d4fb66327c56553a
Author: Kyle McMartin <kyle@dreadnought.i.jkkm.org>
Date:   Wed Oct 13 21:00:55 2010 -0400

    parisc: lay groundwork for killing __do_IRQ
    
    Use proper accessors and handlers for generic irq cleanups. We just
    call back into __do_IRQ through desc->handler now, and remove the
    explicit calls.
    
    Signed-off-by: Kyle McMartin <kyle@redhat.com>

