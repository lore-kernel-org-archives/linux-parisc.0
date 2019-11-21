Return-Path: <SRS0=VRgA=ZN=vger.kernel.org=linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE15C432C0
	for <linux-parisc@archiver.kernel.org>; Thu, 21 Nov 2019 23:30:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07D28206D7
	for <linux-parisc@archiver.kernel.org>; Thu, 21 Nov 2019 23:30:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="ftocBRxn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbfKUXag (ORCPT
        <rfc822;linux-parisc@archiver.kernel.org>);
        Thu, 21 Nov 2019 18:30:36 -0500
Received: from mail-40132.protonmail.ch ([185.70.40.132]:64278 "EHLO
        mail-40132.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfKUXag (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Thu, 21 Nov 2019 18:30:36 -0500
Date:   Thu, 21 Nov 2019 23:30:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=proton;
        t=1574379034; bh=6KbYvpux2nDwaPelUh4amIrvxMu3Rdu4WfqOTwdqS3M=;
        h=Date:To:From:Reply-To:Subject:Feedback-ID:From;
        b=ftocBRxnchJdoHPOo6VWI3rNYv3/oZ5J4dPoRa2SfdsziuSe8q9l7b0JdszcnUUJZ
         gKwpU74mBStI/U51h8DPNNqqpNdWcGq7yA8dk61yYo4IO6FOGID69TuGV3WQD0LULE
         XdQPkDAiq9SVdY7gGgB8edWF3SaS70LZqef/qbsmXNiJwgQ7o1Chs/0uQrejDiyoSE
         QFJWXQ2ZkFENH9XQewpHrbTklBpNdgd/nQNboDKpUB5G/BfNnxH/43MdqhDbp7YPe0
         QKkqjtzFVruqt7fe37s+UPn70lQ4KSODjfnjfQg1RPnxdMWW2DCWHs6/EXVsn2fEU8
         yFN2lBQhEco4Q==
To:     linux-parisc@vger.kernel.org
From:   Phil Scarr <phil.scarr@pm.me>
Reply-To: Phil Scarr <phil.scarr@pm.me>
Subject: tigon3 firmware
Message-ID: <48306AD4-DA2B-4E37-B52A-050A02E9B565@pm.me>
Feedback-ID: AnDrjaQTA1mIrVwhEbJn-LrXpVWgkp5-ycaTfIL-MTxGUAlZPyisXimQB5plDXm-ITvR42cG8qwUhD6jMQpd3Q==:Ext:ProtonMail
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-parisc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

I=E2=80=99m getting the following errors when the system rebuilds initrd:

update-initramfs: Generating /boot/initrd.img-4.16.0-1-parisc64-smp
W: Possible missing firmware /lib/firmware/tigon/tg3_tso5.bin for module tg=
3
W: Possible missing firmware /lib/firmware/tigon/tg3_tso.bin for module tg3
W: Possible missing firmware /lib/firmware/tigon/tg3.bin for module tg3

There don=E2=80=99t appear to be any nonfree firmware for hppa.  Is this ex=
pected?


--=20
Currently Reading

  Get your own email signature


