From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: gcc-4.5 -fdelayed-branch strikes back
Date: Sun, 13 Jun 2010 15:24:47 -0400
Message-ID: <20100613192447.GA14692@hiauly1.hia.nrc.ca>
References: <20100604181712.43456ddb@borg.bxl.tuxicoman.be> <20100604193229.473BB515D@hiauly1.hia.nrc.ca> <20100605115808.0ff33504@borg.bxl.tuxicoman.be> <20100607232907.GA10176@hiauly1.hia.nrc.ca> <20100611194516.496c2ddf@zombie>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100611194516.496c2ddf@zombie>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, 11 Jun 2010, Guy Martin wrote:

Hi Guy,

> The test case should make things pretty easy to repro. But if you need
> some more details let me know.

I wasn't able to get your testcase to fail with my last build of 4.5.1.
It used 4.3.3 for the bootstrap compiler.  I'm fairly certain 4.5 is
being miscompliled in stage1 when 4.4 is used as the bootstap compiler.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
