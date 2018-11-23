Return-Path: <SRS0=RjUW=OC=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F23C43441
	for <linux-parisc@archiver.kernel.org>; Fri, 23 Nov 2018 19:26:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F08620874
	for <linux-parisc@archiver.kernel.org>; Fri, 23 Nov 2018 19:26:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F08620874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-parisc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441347AbeKXGL4 (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Sat, 24 Nov 2018 01:11:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:53636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726004AbeKXGL4 (ORCPT <rfc822;linux-parisc@vger.kernel.org>);
        Sat, 24 Nov 2018 01:11:56 -0500
Received: from vmware.local.home (cpe-66-24-56-78.stny.res.rr.com [66.24.56.78])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2688920861;
        Fri, 23 Nov 2018 19:26:19 +0000 (UTC)
Date:   Fri, 23 Nov 2018 14:26:17 -0500
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Sasha Levin <sashal@kernel.org>
Cc:     Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "James E.J. Bottomley" <jejb@parisc-linux.org>,
        linux-parisc@vger.kernel.org, stable@kernel.org,
        stable@vger.kernel.org
Subject: Re: [for-next][PATCH 08/18] parisc: function_graph: Simplify with
 function_graph_entry()
Message-ID: <20181123142617.3d3972ca@vmware.local.home>
In-Reply-To: <20181123183415.GB1917@sasha-vm>
References: <20181122003332.500796758@goodmis.org>
        <20181123073033.2083020863@mail.kernel.org>
        <511cb47a-a1bd-bb5d-69ec-0836c6b5abfe@gmx.de>
        <20181123121253.278146b4@vmware.local.home>
        <20181123183415.GB1917@sasha-vm>
X-Mailer: Claws Mail 3.15.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Fri, 23 Nov 2018 13:34:15 -0500
Sasha Levin <sashal@kernel.org> wrote:

> Does this mean that someone (Steve) will send a backport of this to all
> relevant stable trees? Right now it looks like the series will randomly
> apply on a mix of trees, which can't be good.

Nope. I stated that in my 0 patch.

-- Steve
