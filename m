From: Matt Turner <mattst88@gmail.com>
Subject: Re: [PATCH] ipmi/parisc: Add IPMI chassis
 poweroff for certain HP PA-RISC servers
Date: Mon, 26 Mar 2018 11:43:42 -0700
Message-ID: <CAEdQ38EoCOOpwnAPRuHXba0TqZgiZMsd6yo01UjQuKfNsh8HRQ@mail.gmail.com>
References: <20180324194504.GA10210@ls3530.fritz.box>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
 openipmi-developer@lists.sourceforge.net,
 John David Anglin <dave.anglin@bell.net>, Corey Minyard <minyard@acm.org>,
 linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <openipmi-developer-bounces@lists.sourceforge.net>
In-Reply-To: <20180324194504.GA10210@ls3530.fritz.box>
List-Id: Developer list of OpenIPMI library and Linux driver
 <openipmi-developer.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/openipmi-developer>,
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=openipmi-developer>
List-Post: <mailto:openipmi-developer@lists.sourceforge.net>
List-Help: <mailto:openipmi-developer-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/openipmi-developer>,
 <mailto:openipmi-developer-request@lists.sourceforge.net?subject=subscribe>
Errors-To: openipmi-developer-bounces@lists.sourceforge.net

On Sat, Mar 24, 2018 at 12:45 PM, Helge Deller <deller@gmx.de> wrote:
> This patch allows HP PA-RISC servers like rp3410/rp3440 and the HP C8000
> workstation with an IPMI controller that predate IPMI 1.5 to use the standard
> poweroff or powercycle commands.
>
> These systems firmware don't set the chassis capability bit in the Get
> Device ID, but they do implement the standard poweroff and powercycle
> commands.
>
> Signed-off-by: Helge Deller <deller@gmx.de>

Thanks. I applied your three patches relating to power off and my
C8000 now properly powers off (surprise surprise! :)

Tested-by: Matt Turner <mattst88@gmail.com>

------------------------------------------------------------------------------
Check out the vibrant tech community on one of the world's most
engaging tech sites, Slashdot.org! http://sdm.link/slashdot
