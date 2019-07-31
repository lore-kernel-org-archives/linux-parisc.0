Return-Path: <SRS0=YSU+=V4=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 088BFC433FF
	for <linux-parisc@archiver.kernel.org>; Wed, 31 Jul 2019 19:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0A5B206A3
	for <linux-parisc@archiver.kernel.org>; Wed, 31 Jul 2019 19:56:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="tODytkcP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="tODytkcP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726672AbfGaT4L (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Wed, 31 Jul 2019 15:56:11 -0400
Received: from bedivere.hansenpartnership.com ([66.63.167.143]:34082 "EHLO
        bedivere.hansenpartnership.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726553AbfGaT4L (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Wed, 31 Jul 2019 15:56:11 -0400
Received: from localhost (localhost [127.0.0.1])
        by bedivere.hansenpartnership.com (Postfix) with ESMTP id 3723A8EE12F;
        Wed, 31 Jul 2019 12:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564602971;
        bh=PCYr0JuVFriaEju3xwSpAkWUJa0qnXtQgjlFDgaUkr8=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=tODytkcPMANKMF3tt6p20h6DHUkGXg5kFRHZz7YJ3q3yudQjY/EnDz7VGelW00O2h
         82HG+95vtCvBpfWQEDOm7pZZN8fNC21lDJK9PSacI4okJJZSWU84nn+7zRxycNZp0Q
         rqqZ9SSshHxQl6O0EEgax6YizmJh2HYC/2AmGk/Y=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
        by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SBp_6DUC34Nk; Wed, 31 Jul 2019 12:56:11 -0700 (PDT)
Received: from jarvis.lan (unknown [50.35.71.147])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id D27518EE10C;
        Wed, 31 Jul 2019 12:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
        s=20151216; t=1564602971;
        bh=PCYr0JuVFriaEju3xwSpAkWUJa0qnXtQgjlFDgaUkr8=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=tODytkcPMANKMF3tt6p20h6DHUkGXg5kFRHZz7YJ3q3yudQjY/EnDz7VGelW00O2h
         82HG+95vtCvBpfWQEDOm7pZZN8fNC21lDJK9PSacI4okJJZSWU84nn+7zRxycNZp0Q
         rqqZ9SSshHxQl6O0EEgax6YizmJh2HYC/2AmGk/Y=
Message-ID: <1564602968.3319.56.camel@HansenPartnership.com>
Subject: Re: Compressed kernels currently won't boot
From:   James Bottomley <James.Bottomley@HansenPartnership.com>
To:     Helge Deller <deller@gmx.de>, Sven Schnelle <svens@stackframe.org>
Cc:     Parisc List <linux-parisc@vger.kernel.org>
Date:   Wed, 31 Jul 2019 12:56:08 -0700
In-Reply-To: <0084df92-ca9f-7600-187d-bc6123f30fd1@gmx.de>
References: <1564591443.3319.30.camel@HansenPartnership.com>
         <20190731173016.GA23520@t470p.stackframe.org>
         <1564595402.3319.40.camel@HansenPartnership.com>
         <1564602012.3319.45.camel@HansenPartnership.com>
         <20190731194413.GB23520@t470p.stackframe.org>
         <0084df92-ca9f-7600-187d-bc6123f30fd1@gmx.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

On Wed, 2019-07-31 at 21:46 +0200, Helge Deller wrote:
> On 31.07.19 21:44, Sven Schnelle wrote:
> > Hi James,
> > 
> > On Wed, Jul 31, 2019 at 12:40:12PM -0700, James Bottomley wrote:
> > 
> > > What about causing the compressed make to build both a stripped
> > > and a non-stripped bzImage (say sbzImage and bzImage).  That way
> > > you always have the stripped one available for small size things
> > > like boot from tape or DVD?  but in the usual case we use the
> > > bzImage with full contents.
> > 
> > In that case we would also need to build two lifimages - how about
> > adding a config option option? Something like "Strip debug
> > information from compressed kernel images"?
> 
> I agree, two lifimages don't make sense. Only one vmlinuz gets
> installed. Instead of the config option, I tink my latest patch is
> better.

It doesn't solve the problem that if a stripped compressed image is >
128kb then it overwrites the decompress area starting at 0x00100000 so
we can't decompress the end because we've already overwritten it before
the decompressor gets to it.

What we could possibly do is be clever and align the .rodata.compressed
so its last text byte ends where the uncompressed kernel text would
end.  We could be even more clever and split .rodata.compressed into a
load and a noload part so we would only load the part of the compressed
kernel we need.  Then the lifimage creation scripts could discard the
noload part containing the debug symbols.

James

