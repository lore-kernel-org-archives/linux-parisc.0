From: "Andy Walker" <ajwalker@broadpark.no>
Subject: Re: [parisc-linux] ncr53c8xx patch for c110
Date: Sun, 20 Jun 2004 07:55:09 +0200 (CEST)
Message-ID: <38934.127.0.0.1.1087710909.squirrel@www.puszczka.com>
References: <40BD9F8700009BB8@ocpmta2.freegates.net><1087569206.2078.13.camel@mulgrave>
	<40D30E3C.1010809@tiscali.be> <40D34A27.8060009@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux@parisc-linux.org
To: "Joel Soete" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40D34A27.8060009@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Hello James & Grant,
> Joel Soete wrote:
>>
>> otc I trust that backporting sym_scatter() into ncr_scatter() is a fix
>> ;) (i was not very sure)
> [snip]
>>
>>
>> James Bottomley wrote:
>>
>>> Could you try this.  It doesn't fix the problems in the ncr driver, but
>>> it does force the block layer to respect the DISABLE_CLUSTERING flag.
>>>
>>> James
>>>
>>> ===== drivers/block/ll_rw_blk.c 1.244 vs edited =====
>>> --- 1.244/drivers/block/ll_rw_blk.c    2004-05-29 11:18:19 -05:00
>>> +++ edited/drivers/block/ll_rw_blk.c    2004-06-18 09:27:19 -05:00
>>> @@ -850,7 +850,7 @@
>>>              continue;
>>>          }
>>>  new_segment:
>>> -        if (BIOVEC_VIRT_MERGEABLE(bvprv, bv) &&
>>> +        if (cluster && BIOVEC_VIRT_MERGEABLE(bvprv, bv) &&
>>>              !BIOVEC_VIRT_OVERSIZE(hw_seg_size + bv->bv_len)) {
>>>              hw_seg_size += bv->bv_len;
>>>          } else {
>>>
>>>
>>
> I just test your patch and the following "backport" of sym_scatter in
> ncr53c8xx:
> --- linux-2.6.7-pa1-wrk/drivers/scsi/ncr53c8xx.h.orig   2004-06-18
> 20:30:09.000000000 +0200
> +++ linux-2.6.7-pa1-wrk/drivers/scsi/ncr53c8xx.h        2004-06-18
> 21:15:45.703972000 +0200
> @@ -48,6 +48,18 @@
>
>   #include "sym53c8xx_defs.h"
>
> +/*
> +       Build a scatter/gather entry.
> +       see sym53c8xx_2/sym_hipd.h for more detailed sym_build_sge()
> +       implementation ;)
> + */
> +
> +#define ncr_build_sge(np, data, badd, len)     \
> +do {                                           \
> +       (data)->addr = cpu_to_scr(badd);        \
> +       (data)->size = cpu_to_scr(len);         \
> +} while (0)
> +
>   /*==========================================================
>   **
>   **     Structures used by the detection routine to transmit
> --- linux-2.6.7-pa1-wrk/drivers/scsi/ncr53c8xx.c.orig   2004-05-30
> 01:28:20.000000000 +0200
> +++ linux-2.6.7-pa1-wrk/drivers/scsi/ncr53c8xx.c        2004-06-18
> 21:53:34.803972000 +0200
> @@ -91,7 +91,7 @@
>   */
>
>   /* Name and version of the driver */
> -#define SCSI_NCR_DRIVER_NAME   "ncr53c8xx-3.4.3e"
> +#define SCSI_NCR_DRIVER_NAME   "ncr53c8xx-3.4.3f"
>
>   #define SCSI_NCR_DEBUG_FLAGS   (0)
>
> @@ -839,7 +839,7 @@
>          struct scr_tblmove smsg  ;
>          struct scr_tblmove cmd   ;
>          struct scr_tblmove sense ;
> -       struct scr_tblmove data [MAX_SCATTER];
> +       struct scr_tblmove data[MAX_SCATTER];
>   };
>
>
> @@ -3845,7 +3845,7 @@
>
>          direction = scsi_data_direction(cmd);
>          if (direction != SCSI_DATA_NONE) {
> -               segments = ncr_scatter (np, cp, cp->cmd);
> +               segments = ncr_scatter(np, cp, cp->cmd);
>                  if (segments < 0) {
>                          ncr_free_ccb(np, cp);
>                          return(DID_ERROR);
> @@ -7575,44 +7575,57 @@
>   **     sizes to the data segment array.
>   */
>
> -static int     ncr_scatter(struct ncb *np, struct ccb *cp, struct
> scsi_cmnd *cmd)
> +static int ncr_scatter_no_sglist(struct ncb *np, struct ccb *cp, struct
> scsi_cmnd *cmd)
>   {
> -       struct scr_tblmove *data;
> -       int segment     = 0;
> -       int use_sg      = (int) cmd->use_sg;
> +       struct scr_tblmove *data = &cp->phys.data[MAX_SCATTER - 1];
> +       int segment;
>
> -       data            = cp->phys.data;
> -       cp->data_len    = 0;
> +       cp->data_len = cmd->request_bufflen;
>
> -       if (!use_sg) {
> -               if (cmd->request_bufflen) {
> -                       u_long baddr = map_scsi_single_data(np, cmd);
> -
> -                       data = &data[MAX_SCATTER - 1];
> -                       data[0].addr = cpu_to_scr(baddr);
> -                       data[0].size = cpu_to_scr(cmd->request_bufflen);
> -                       cp->data_len = cmd->request_bufflen;
> +       if (cmd->request_bufflen) {
> +               dma_addr_t baddr = map_scsi_single_data(np, cmd);
> +               if (baddr) {
> +                       ncr_build_sge(np, data, baddr,
> cmd->request_bufflen);
>                          segment = 1;
> +               } else {
> +                       segment = -2;
>                  }
> +       } else {
> +               segment = 0;
>          }
> -       else if (use_sg <= MAX_SCATTER) {
> +
> +       return segment;
> +}
> +
> +static int ncr_scatter(struct ncb *np, struct ccb *cp, struct scsi_cmnd
> *cmd)
> +{
> +       int segment     = 0;
> +       int use_sg      = (int) cmd->use_sg;
> +
> +       cp->data_len    = 0;
> +
> +       if (!use_sg)
> +               segment = ncr_scatter_no_sglist(np, cp, cmd);
> +       else if ((use_sg = map_scsi_sg_data(np, cmd)) > 0) {
>                  struct scatterlist *scatter = (struct scatterlist
> *)cmd->buffer;
> +               struct scr_tblmove *data;
> +
> +               if (use_sg > MAX_SCATTER) {
> +                       unmap_scsi_data(np, cmd);
> +                       return -1;
> +               }
> +
> +               data = &cp->phys.data[MAX_SCATTER - use_sg];
>
> -               use_sg = map_scsi_sg_data(np, cmd);
> -               data = &data[MAX_SCATTER - use_sg];
> +               for (segment = 0; segment < use_sg; segment++) {
> +                       dma_addr_t baddr =
> sg_dma_address(&scatter[segment]);
> +                       unsigned int len = sg_dma_len(&scatter[segment]);
>
> -               while (segment < use_sg) {
> -                       u_long baddr =
> scsi_sg_dma_address(&scatter[segment]);
> -                       unsigned int len =
> scsi_sg_dma_len(&scatter[segment]);
> -
> -                       data[segment].addr = cpu_to_scr(baddr);
> -                       data[segment].size = cpu_to_scr(len);
> -                       cp->data_len      += len;
> -                       ++segment;
> +                       ncr_build_sge(np, &data[segment], baddr, len);
> +                       cp->data_len += len;
>                  }
> -       }
> -       else {
> -               return -1;
> +       } else {
> +               segment = -2;
>          }
>
>          return segment;
> =========><=========
>
> And all works fine now for me. Unfortunately I don't have other model (C,
> D, R, J or K) using the same driver to test it more :(
>
> I don't have any cvs ci access, so if there are no negative feedback can
> somebody ci.
>
> Thanks in advance,
> 	Joel

Hi folks,

Excellent! Just tried this patch on my C180 and can confirm it works.
I'll give it a spin on the B132L too - but the box is heavily tied up
compiling today.

Thanks for working on this Joel.

-Andy
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
