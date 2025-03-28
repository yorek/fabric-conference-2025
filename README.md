# Fabric Conference 2025

Demos used a Fabric Conference 2025

WORK IN PROGRESS

## Vector 101

You can use the scripts in this folder to have an introduction to vectors in Azure SQL, embeddings and similarity search.

You need to have an embedding model deployed in Azure OpenAI and then make sure to replace the following placeholder you'll find in the scripts, with the correct values for your deployment:

- `$OPENAI_URL$`: for example, *https://my-ai-test.openai.azure.com*
- `$OPENAI_KEY$`: for example, *1234567890abcdef1234567890abcdef*
- `$OPENAI_EMBEDDING_DEPLOYMENT_NAME$`: for example, *text-embedding-3-small*

## Retrieval Augemented Generation sample

A practical sample of RAG pattern applied to a real-world use case: make finding samples using Azure SQL easier and more efficient!

https://github.com/yorek/azure-sql-db-ai-samples-search

The script used to add the present sample to the samples available to the AI Search demo is the following:

```sql
exec dbo.add_sample '
{
    "name": "Live360 2024 Orlando Demos", 
    "description": "Demos used at the Live360 2024 Orlando conference",
    "notes": "",
    "url": "https://github.com/yorek/live360-2024-orlando",
    "details": {
        "authors": ["Davide Mauri"],
        "languages": ["T-SQL", ".NET", "C#"],                
        "services": ["Azure SQL"],
        "conferences": ["Live360 2024 Orlando"]
    }
}
';
```

## RAG + NL2SQL sample

Using Azure SQL and Semantic Kernel to chat with your own data using a mix of NL2SQL and RAG

https://github.com/Azure-Samples/azure-sql-db-chat-sk