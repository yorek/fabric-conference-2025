# Fabric Conference 2025

## Workshop "Building AI applications with SQL: Ground to Cloud to Fabric"

Demos and samples used a Fabric Conference 2025 Workshop "Building AI applications with SQL: Ground to Cloud to Fabric".

You can use the scripts in this folder to have an introduction to vectors in Azure SQL, embeddings and similarity search.

You need to have an embedding model deployed in Azure OpenAI and then make sure to replace the following placeholder you'll find in the scripts, with the correct values for your deployment:

[Azure OpenAI](https://learn.microsoft.com/en-us/azure/ai-services/openai/):

- `$OPENAI_URL$`: for example, *https://my-ai-test.openai.azure.com*
- `$OPENAI_KEY$`: for example, *1234567890abcdef1234567890abcdef*
- `$OPENAI_EMBEDDING_DEPLOYMENT_NAME$`: for example, *text-embedding-3-small*

Azure Vision AI (needed for [Multimodal Embeddings](https://learn.microsoft.com/azure/ai-services/computer-vision/how-to/image-retrieval?tabs=csharp) sample):

- `$AIVISION_URL$`: for example, *https://my-vision-test.cognitiveservices.azure.com*
- `$AIVISION_KEY$`: for example, *1234567890abcdef1234567890abcdef*

[Azure Content Safety](https://learn.microsoft.com/en-us/azure/ai-services/content-safety/overview):

- `$CONTENTSAFETY_URL$`: for example, *https://my-cs-test.cognitiveservices.azure.com*
- `$CONTENTSAFETY_KEY$`: for example, *1234567890abcdef1234567890abcdef*

## Session "Operational RAG Solutions with Azure SQL and Microsoft Fabric"

The session showed how to build an operational RAG solution using Azure SQL and Microsoft Fabric. The application built is the one you can find here: https://github.com/yorek/azure-sql-db-ai-samples-search

Another Agentic RAG applications, more complex and powerful, is available here:

https://github.com/Azure-Samples/azure-sql-db-chat-sk
