From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Happy New Year PARISC
Date: Tue, 03 Jan 2012 11:42:10 -0500
Message-ID: <4F032FE2.4020000@bell.net>
References: <BLU0-SMTP8506059BFA40F0B7419F2497900@phx.gbl>  <CANEJEGv5jOLEywzj52KVsdQHJmXf5GxWDBaJZNnbfnwhYcR23A@mail.gmail.com>  <BLU0-SMTP31AEFBE4BAA62F2EED77CE97910@phx.gbl>  <BLU0-SMTP20DB85B206E6F015C370CE97910@phx.gbl>  <CADZpyiywh8SL42H9nO=9tMXgiyxL4SfmaX6PcZP5Kwme-Ozxsw@mail.gmail.com>  <4F031B1A.4010908@bell.net> <1325604740.3185.4.camel@dabdike.int.hansenpartnership.com> <4F032C4C.10805@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	Grant Grundler <grantgrundler@gmail.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4F032C4C.10805@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1/3/2012 11:26 AM, John David Anglin wrote:
> I replaced
> the kunmap_atomic calls with pagefault_enable to avoid the flush in 
> the returns from
> clear/copy_user_page (actually, I only used one call to 
> pagefault_enable, so maybe
> that was the issue).
It looks like I messed up the enable.  Will retry.

Dave

-- 
John David Anglin    dave.anglin@bell.net

