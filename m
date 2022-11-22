Return-Path: <linux-parisc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C452C433FE
	for <linux-parisc@archiver.kernel.org>; Tue, 22 Nov 2022 00:56:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbiKVAz5 (ORCPT <rfc822;linux-parisc@archiver.kernel.org>);
        Mon, 21 Nov 2022 19:55:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbiKVAzr (ORCPT
        <rfc822;linux-parisc@vger.kernel.org>);
        Mon, 21 Nov 2022 19:55:47 -0500
Received: from mail-vk1-xa2a.google.com (mail-vk1-xa2a.google.com [IPv6:2607:f8b0:4864:20::a2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0047FDEAF0;
        Mon, 21 Nov 2022 16:55:46 -0800 (PST)
Received: by mail-vk1-xa2a.google.com with SMTP id o24so6486194vkl.9;
        Mon, 21 Nov 2022 16:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=baAhH3/WkFmeTezOxfvudGuEA9+2KRVNJOWtV/KPQ0w=;
        b=eX2MIoRDEiiw9scdd3Wgkiuc+GdTBNsAis8nOckYwh8ojmKR1WHwbCJ11OqtAAkj3d
         f9yX0GG38r1BdN8DJkocoLGHTdyvetbxz9wXYn1mowfqGodbBwCTnKOcM+xO6uQqqBVN
         BHq5h33FZhRruEh1sUiy5bjHaVbI7YifCA3xIPRySUQ9rmyBfi8fSMXcAnOZ/pdaHrw4
         PeopY7Qyj/nZgJZaZXrL3T9Jek7cuhCaF/ATZicbGkS62Xskyx1aMeOM61JHdhDkMPjW
         33OPX/I3qzENOOFnO30xa1R+ANmkK2NmYMPrMrAJDpfs5GFwFwvFmM2jhgzOqZE5sOo5
         P6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=baAhH3/WkFmeTezOxfvudGuEA9+2KRVNJOWtV/KPQ0w=;
        b=d6j3bIwXW7wPxaNYRXYEKpJnW27sg+jnwSA/RPq20/2o2bhMLRC1EWbKOMYa4MTeS4
         AozbBw4wxDu+gs+Gl+mtdboCo3VRQAT1Bn0bt2VZUl3Yu3u5dhan5Ljw2Z7DcXb2Jwps
         6Z4tMbiuNAgU42+0YlZW81bJd0eH0sfZoqLKtUspcG2fIhnn97NByE1DrkrkEjGPexKi
         veNWinvrtwhjIaWEk1vlfl6eSkkwJuftoyP1Gikp8HAAddvfWEZS09d5ed4GkCVXdLh/
         33TDPvy+Mm6Z6lOb8N194lELIqpqIkSNkrK6+DYzQVNv7zqZQm/bvOzLKJaGei5y+row
         2SRQ==
X-Gm-Message-State: ANoB5pm9OAKRTNiGPpUuDokaDOQXT8pdW48kYmG7dBNBR3tCIb5e72eM
        LTQXhU/BoF0DaHYEnZc+k+hEu9DCiXHQRMFz25I=
X-Google-Smtp-Source: AA0mqf4AzMSaCEzO71xYpTEE3h2JPDSTudPdJ8CpWxSnKtcSHjoArtjGYsDf0xhcmUZuhdqLaZ8FfT9ISXhLAOxCYJU=
X-Received: by 2002:ac5:c915:0:b0:3b8:7fbd:9554 with SMTP id
 t21-20020ac5c915000000b003b87fbd9554mr1048492vkl.27.1669078546108; Mon, 21
 Nov 2022 16:55:46 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:620f:0:0:0:0:0 with HTTP; Mon, 21 Nov 2022 16:55:45
 -0800 (PST)
From:   Raj Singh <rajsinghreii69@gmail.com>
Date:   Mon, 21 Nov 2022 16:55:45 -0800
Message-ID: <CALNxRi1SCh4PNWQvh63aDZ-=kw9+vFOGTqGV9E8a0HqQAH4wig@mail.gmail.com>
Subject: Re:ONLINE NOTIFICATION
To:     linux 201011 <linux-201011@tower-net.de>,
        linux arm kernel <linux-arm-kernel@lists.infradead.org>,
        linux cifs <linux-cifs@vger.kernel>,
        linux kernel <linux-kernel@vger.kernel.org>,
        linux parisc <linux-parisc@vger.kernel.org>,
        linux4michelle <linux4michelle@freenet.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-parisc.vger.kernel.org>
X-Mailing-List: linux-parisc@vger.kernel.org

https://bit.ly/3hO0niG
