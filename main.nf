#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/genomeasembler
========================================================================================
    Github : https://github.com/nf-core/genomeasembler
    Website: https://nf-co.re/genomeasembler
    Slack  : https://nfcore.slack.com/channels/genomeasembler
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { GENOMEASEMBLER } from './workflows/genomeasembler'

//
// WORKFLOW: Run main nf-core/genomeasembler analysis pipeline
//
workflow NFCORE_GENOMEASEMBLER {
    GENOMEASEMBLER ()
}

/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
// See: https://github.com/nf-core/rnaseq/issues/619
//
workflow {
    NFCORE_GENOMEASEMBLER ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
