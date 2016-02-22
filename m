From: John David Anglin <dave.anglin@bell.net>
Subject: Re: SCSI bug
Date: Sun, 21 Feb 2016 22:24:22 -0500
Message-ID: <951EFC7D-4166-41E5-BD1B-E22EE7884AD7@bell.net>
References: <28D5FC66-A9E6-4F3E-A8AC-F9E68A6BC543@bell.net> <82D4BF6F-05CF-4441-9530-79475BFF84F3@bell.net> <E2C8DBC2-F0AD-4C78-BD63-9C85B387E284@bell.net> <56C8E1AC.3030409@gmx.de> <038473FE-9E6D-4F03-BBD4-9844B7B529E1@bell.net> <9C42B388-96D5-412A-BAC3-14E93415CA21@bell.net> <1456026424.2268.5.camel@HansenPartnership.com> <14EF1F4E-8045-4990-B29E-D489E82B1929@bell.net> <1456078381.2340.5.camel@HansenPartnership.com> <D14AFC12-8245-4862-9FFA-92A4F114FC41@bell.net> <1456081676.2340.10.camel@HansenPartnership.com> <56CA11D2.3020900@gmx.de> <1456086490.2340.18.camel@HansenPartnership.com> <28582474-5AB3-4022-86FE-E823F5990623@bell.net> <56CA2982.1030607@gmx.de> <0905D3D6-635F-4E09-BFD0-2EBE5DA0B0CC@bell.net>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <0905D3D6-635F-4E09-BFD0-2EBE5DA0B0CC@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2016-02-21, at 7:53 PM, John David Anglin wrote:

> Backtrace:                                                                      
> [<000000004046f4b0>] scsi_init_sgtable+0x70/0xb8                               
> [<000000004046f564>] scsi_init_io+0x6c/0x220                                   
> [<000000000811c5c0>] sd_setup_read_write_cmnd+0x58/0x968 [sd_mod]              
> [<000000000811cf14>] sd_init_command+0x44/0x130 [sd_mod]                       
> [<000000004046f81c>] scsi_setup_cmnd+0x104/0x1b0                               
> [<000000004046fab8>] scsi_prep_fn+0x100/0x1a0                                  
> [<000000004035b9b0>] blk_peek_request+0x1b8/0x298                              
> [<0000000040471028>] scsi_request_fn+0xf8/0xa90                                
> [<0000000040357244>] __blk_run_queue+0x4c/0x70                                 
> [<00000000403802c4>] cfq_insert_request+0x2dc/0x580                            
> [<0000000040356404>] __elv_add_request+0x1b4/0x300                             
> 
> We have in blk-merge.c:
> 
>                else {
>                        /*
>                         * If the driver previously mapped a shorter
>                         * list, we could see a termination bit
>                         * prematurely unless it fully inits the sg
>                         * table on each mapping. We KNOW that there
>                         * must be more entries here or the driver
>                         * would be buggy, so force clear the
>                         * termination bit to avoid doing a full
>                         * sg_init_table() in drivers for each command.
>                         */
>                        if (sg_is_last (*sg))
>                          printk ("__blk_segment_map_sg: clearing termination bi
> t\n");
>                        sg_unmark_end(*sg);
>                        *sg = sg_next(*sg);
>                        BUG_ON (!*sg);
>                }
> 
> The comment suggests there must be more entries...

I'm thinking with the split the scsi driver needs to provide one or two extra entires in the sg list.

Dave
--
John David Anglin	dave.anglin@bell.net



