Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A6E74854
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 10:52:44 -0600 (MDT)
Date: Mon, 26 Apr 2004 18:52:40 +0200
Message-ID: <408D3DDB00000005@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
To: "Grant Grundler" <grundler@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: kernel>=2.6.4-rc3 hung or panic on C1[18]0
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

I know it shouldn't be the source of the pb but btw I noticed:

> ncr53c8xx.c:7594:	u_long baddr = map_scsi_single_data(np, cmd);

cmd is a "struct scsi_cmnd *" (the parameter of ncr_scatter)

> sym53c8xx_comm.h:699:static int __map_scsi_sg_data(struct device *dev,
Scsi_Cmnd *cmd)
...
sym53c8xx_comm.h:708:	use_sg = dma_map_sg(dev, cmd->buffer, cmd->use_sg,
dma_dir);

and here cmd is a "Scsi_Cmnd *" which is so of different type because of
"typedef struct scsi_cmnd Scsi_Cmnd"


What should it be done?

Thanks in advance for your attention,
    Joel



----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
