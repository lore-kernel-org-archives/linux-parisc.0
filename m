From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 2/2] HIL: remove one goto
Date: Mon, 16 Jan 2012 14:38:49 -0500
Message-ID: <4F147CC9.1070409@bell.net>
References: <6637509.yTD8q5zPsI@eto> <1907306.0Ne3j968CE@eto>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: Rolf Eike Beer <eike@sf-mail.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1907306.0Ne3j968CE@eto>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 1/16/2012 2:13 PM, Rolf Eike Beer wrote:
> +		if (!mlc->istarted) {
> +			/* Prepare to receive input */
> +			if ((node + 1)->act&  HILSE_IN)
> +				hilse_setup_input(mlc, node + 1);
> +		}
It looks to me like this could be further simplified with an &&.

Dave

-- 
John David Anglin    dave.anglin@bell.net

