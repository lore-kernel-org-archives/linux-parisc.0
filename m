Return-Path: <SRS0=Gf7V=Y4=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33E8BCA9EB5
	for <linux-parisc@archiver.kernel.org>; Mon,  4 Nov 2019 13:20:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F688222C1
	for <linux-parisc@archiver.kernel.org>; Mon,  4 Nov 2019 13:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729207AbfKDNUb (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 4 Nov 2019 08:20:31 -0500
Received: from smtprelay0102.hostedemail.com ([216.40.44.102]:48604 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729058AbfKDNUQ (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 4 Nov 2019 08:20:16 -0500
X-Greylist: delayed 511 seconds by postgrey-1.27 at vger.kernel.org; Mon, 04 Nov 2019 08:20:15 EST
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave06.hostedemail.com (Postfix) with ESMTP id 837928122692
        for <linux-parisc@vger.kernel.org>; Mon,  4 Nov 2019 13:11:45 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id AA5684DBD;
        Mon,  4 Nov 2019 13:11:43 +0000 (UTC)
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-HE-Tag: bat51_e8cae9c64d2a
X-Filterd-Recvd-Size: 1974
Received: from grimm.local.home (unknown [146.247.46.6])
        (Authenticated sender: rostedt@goodmis.org)
        by omf13.hostedemail.com (Postfix) with ESMTPA;
        Mon,  4 Nov 2019 13:11:39 +0000 (UTC)
Date:   Mon, 4 Nov 2019 08:11:36 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Amit Daniel Kachhap <amit.kachhap@arm.com>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, deller@gmx.de, duwe@suse.de,
        James.Bottomley@HansenPartnership.com, james.morse@arm.com,
        jeyu@kernel.org, jpoimboe@redhat.com, jthierry@redhat.com,
        linux-parisc@vger.kernel.org, mingo@redhat.com,
        peterz@infradead.org, svens@stackframe.org,
        takahiro.akashi@linaro.org, will@kernel.org
Subject: Re: [PATCHv2 1/8] ftrace: add ftrace_init_nop()
Message-ID: <20191104081136.645e9b1a@grimm.local.home>
In-Reply-To: <daad0785-a33f-3cfb-cf0f-657b6c677257@arm.com>
References: <20191029165832.33606-1-mark.rutland@arm.com>
        <20191029165832.33606-2-mark.rutland@arm.com>
        <daad0785-a33f-3cfb-cf0f-657b6c677257@arm.com>
X-Mailer: Claws Mail 3.17.4git49 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Sat, 2 Nov 2019 17:49:00 +0530
Amit Daniel Kachhap <amit.kachhap@arm.com> wrote:

> Now that ftrace_init_nop is also an arch implemented function so it may 
> be added in Documentation/trace/ftrace-design.rst along with 
> ftrace_make_nop.
> In general also, adding some description about patchable-function-entry
> in kernel Documentation will be useful.

I think this part is outside the scope of this patch set. Honestly, I
need to chisel out some time to rewrite the ftrace-design document, as
that's been long needed. But that can come at a later time. I'm
currently rewriting some of it now, so it will be best to not waste
effort to update a document that will soon become stale. ;-)

-- Steve
