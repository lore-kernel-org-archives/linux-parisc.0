From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [RFC] Fix warnings from various parisc and hp specific files
Date: Wed, 10 Dec 2008 21:34:00 -0500
Message-ID: <20081211023400.GA18981@hiauly1.hia.nrc.ca>
References: <20081210214638.GA28696@bombadil.infradead.org> <20081211022614.GA18170@hiauly1.hia.nrc.ca>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="J2SCkAp4GZ/dPZZf"
Cc: linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081211022614.GA18170@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 10 Dec 2008, John David Anglin wrote:

> Attached are various fixes to correct warnings.  Mostly, they fix
> warnings about ignoring return values.  There is one warning about
> using a possibly uninitialized variable.

ccio-dma.c patch had some extra stuff.  Re-attaching.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="ccio-dma.c.d.1"

diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
index dcc1e99..a194acb 100644
--- a/drivers/parisc/ccio-dma.c
+++ b/drivers/parisc/ccio-dma.c
@@ -1028,8 +1028,10 @@ static int ccio_proc_info(struct seq_file *m, void *p)
 
 	while (ioc != NULL) {
 		unsigned int total_pages = ioc->res_size << 3;
+#ifdef CCIO_COLLECT_STATS
 		unsigned long avg = 0, min, max;
 		int j;
+#endif
 
 		len += seq_printf(m, "%s\n", ioc->name);
 		

--J2SCkAp4GZ/dPZZf--
