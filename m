From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] parisc: fix LMMIO mismatch between PAT length and MASK register
Date: Wed, 10 Jul 2013 14:14:12 -0700
Message-ID: <CAEdQ38FDuGy_yjB+yV93dtNxJ-kicavhOqFNWLiWesVrbd1uRA@mail.gmail.com>
References: <20130614071142.GB10443@p100.box> <CAEdQ38H_nzCEUGXNOtfH=vQdHJ0HvbhyYKLQm8xzEj+DfevLzw@mail.gmail.com>
 <20130614073827.GA18871@p100.box> <loom.20130709T072537-28@post.gmane.org>
 <51DC29DC.8060106@bell.net> <loom.20130709T200549-18@post.gmane.org>
 <51DC7996.3010405@bell.net> <BLU0-SMTP393134EC9554B3C1E34F9297790@phx.gbl> <216411373487566@web6f.yandex.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: Alex Ivanov <gnidorah@p0n4ik.tk>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <216411373487566@web6f.yandex.ru>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jul 10, 2013 at 1:19 PM, Alex Ivanov <gnidorah@p0n4ik.tk> wrote:
> Thank you so much! Your guess looks to be right. After applying of your
> patch there was no more KP and X just worked.

Nice! Does DRI work?
