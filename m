From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] tulip/de4x5: a possible sleep-in-atomic bug in de4x5_interrupt
Date: Wed, 13 Dec 2017 18:13:53 +0800
Message-ID: <e7489930-b0dd-ff89-a0a6-6fba5a41af5e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: netdev@vger.kernel.org, linux-parisc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: davem@davemloft.net,
        Stephen Hemminger <stephen@networkplumber.org>,
        keescook@chromium.org, dhowells@redhat.com, allen.lkml@gmail.com,
        johannes.berg@intel.com, arvind.yadav.cs@gmail.com
Return-path: <linux-kernel-owner@vger.kernel.org>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

According to drivers/net/ethernet/dec/tulip/de4x5.c, the driver may 
sleep in the interrupt handler.
The function call path is:
de4x5_interrupt (interrupt handler)
   synchronize_irq --> may sleep

I do not find a good way to fix it, so I only report.
This possible bug is found by my static analysis tool (DSAC) and checked 
by my code review.


Thanks,
Jia-Ju Bai
