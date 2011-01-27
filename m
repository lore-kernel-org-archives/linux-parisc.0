From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: HP c8000 failure
Date: Thu, 27 Jan 2011 09:53:09 -0500
Message-ID: <AANLkTim78d_RWXQh5MvtpiULkqxNF-OUYhaXHfW+6gpn@mail.gmail.com>
References: <BLU0-SMTP20449831E77AE6C75F0A2DBBFF10@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: artem.falcon@gmail.com
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP20449831E77AE6C75F0A2DBBFF10@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jan 12, 2011 at 6:26 AM, Alex Vladimirovich
<porebrik@junkemail.ru> wrote:
> Is any technitian there who has some experience with failing c8000s?
> I got oppressive "System Firmware Hang" according to diagnostic LEDs
> on rear panel.

I have found that HP-PARISC hardware is notoriously difficult to fix,
and usually requires buying another box :-)

If I were you (and I recently had to do this for a c3600):

(a) Find the service manual.

(b) Read the section about diagnostic LEDs.

(c) Follow the recommendations.

If that fails, then the box is likely dead, or the manual will say
"Replace main board", which is the equivalent of getting a new box.

Good luck!

Cheers,
Carlos.
