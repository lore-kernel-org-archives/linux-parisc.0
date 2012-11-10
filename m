From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH] HIL: remove one goto
Date: Sat, 10 Nov 2012 00:47:49 -0800
Message-ID: <20121110084749.GC14761@core.coreip.homeip.net>
References: <2837529.xgu9k1gmUb@eto>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, linux-input@vger.kernel.org
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Return-path: <linux-input-owner@vger.kernel.org>
In-Reply-To: <2837529.xgu9k1gmUb@eto>
List-ID: <linux-input.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Oct 31, 2012 at 08:24:34PM +0100, Rolf Eike Beer wrote:
> This goto is only used to skip the next instruction, which can easily be done
> without a goto.
> 
> Signed-off-by: Rolf Eike Beer <eike-kernel@sf-tec.de>

Applied, thank you Rolf.

-- 
Dmitry
